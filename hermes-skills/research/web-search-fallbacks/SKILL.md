---
name: web-search-fallbacks
description: "Search the web via curl when no web_search tool exists."
version: 1.0.0
author: Hermes Agent
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [web-search, curl, github-api, bing, disambiguation, research]
    related_skills: [blocked-page-recovery, grounded-citations]
---

# Web Search Without a Search Tool

## When to Use

Use when you need to find or verify information on the web — identify a
library/tool/product, check whether something exists, answer "what is X" —
but the session has **no `web_search`/`web_fetch` tool**, or the browser tool
is unavailable. Search via `curl` from the terminal instead.

Distinction from `blocked-page-recovery`: that skill recovers the content of a
**specific known URL** that is blocked. This skill is about **searching**
(discovering which URL/info matters in the first place). They compose:
search here to find the URL, recover there if it's blocked.

## Route 1 — GitHub API search (best for libraries/tools/repos)

Structured JSON, no CAPTCHA, authoritative for open-source. Decisive for
"does a named library exist, and how prominent is it":

```bash
curl -sL "https://api.github.com/search/repositories?q=<terms>&sort=stars&per_page=10" \
  | python -c "import json,sys;[print(i['full_name'],'|',i['stargazers_count'],'stars |',(i.get('description') or '')[:80]) for i in json.load(sys.stdin).get('items',[])]"
```

- `q=` terms: separate with `+` (e.g. `q=obi+memory+llm`).
- Unauthenticated rate limit is 10 search req/min — fine for a few probes;
  if rate-limited, wait 60s.
- If **nothing prominent** matches a name the user is confident about, treat
  the name as likely misheard/misremembered — see the disambiguation pattern.

## Route 2 — Bing HTML via curl (general text search)

DuckDuckGo's html/lite endpoints serve a bot-CAPTCHA to curl, but Bing
returns parseable result blocks with a desktop User-Agent:

```bash
cd "$LOCALAPPDATA/Temp"   # NOT /tmp — native tools don't get MSYS path translation
curl -sL -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120 Safari/537.36" \
  "https://www.bing.com/search?q=<query>" -o bing.html
```

Extract result titles + snippets:

```python
import re, html
t = open('bing.html', encoding='utf-8', errors='ignore').read()
for b in re.findall(r'<li class="b_algo".*?</li>', t, re.S):
    m = re.search(r'<h2[^>]*>.*?<a[^>]*href="([^"]+)"[^>]*>(.*?)</a>', b, re.S)
    sn = re.search(r'<p[^>]*>(.*?)</p>', b, re.S)
    title = html.unescape(re.sub('<[^>]*>', '', m.group(2))) if m else '?'
    snip  = html.unescape(re.sub('<[^>]*>', '', sn.group(1))) if sn else ''
    print('-', title, '\n ', snip[:200])
```

Bing result `href`s are `/ck/a?...&u=a1<base64url>` redirect wrappers — the
real URL is base64url-encoded in the `u=` param:

```python
import base64
u = 'a1aHR0cHM6Ly9...'          # the value after u=
print(base64.urlsafe_b64decode(u + '=' * (-len(u) % 4)).decode())
```

## Route 3 — DuckDuckGo html/lite (often CAPTCHA'd)

`https://html.duckduckgo.com/html/?q=...` and `https://lite.duckduckgo.com/lite/?q=...`
work from a real browser but frequently return "Select all squares with a
duck" CAPTCHA to curl. Try once, but do **not** loop — fall through to
Bing/GitHub.

## Route 4 — browser tool (last resort)

If a `browser_exec`-style tool is available, first use may launch Chrome and
require a one-time "Allow remote debugging" click. If it reports that, ask
the user to Allow and retry — don't retry before they confirm.

## Disambiguation pattern (garbled / misheard names)

When a user references a name you don't recognize, don't confidently answer
about the wrong thing and don't just guess:

1. **Verify existence first** via GitHub API + web search.
2. If nothing prominent matches, **say so plainly**, then list the real
   candidates ranked by likelihood (stars/prominence) with one-line
   descriptions.
3. **Ask the user to confirm** which one — or for the context where they saw
   it (article, video, screenshot) — before going deep.

Worked example: user asked about an "Obi" memory library. GitHub + web search
showed no prominent match → presented Mem0 / Zep-Graphiti / Letta / Cognee →
user clarified they meant **Obsidian** (a note app, not a memory library).
