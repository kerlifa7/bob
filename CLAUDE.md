# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
node index.js   # run the app
npm start       # same as above
npm test        # placeholder — no tests configured yet (exits with error)
```

## Architecture

Minimal Node.js project with a single entry point.

```
bob/
├── index.js                      # Entry point — prints "Hello, bob!" to stdout
├── package.json                  # Project metadata, scripts, no external dependencies
├── package-lock.json             # Auto-generated lock file (untracked)
├── README.md                     # Brief project overview
├── CLAUDE.md                     # This file
└── .claude/
    ├── settings.json             # Claude Code hooks configuration
    └── hooks/
        └── session-start.sh      # SessionStart hook for remote environments
```

## Key Files

- **`index.js`**: Single `console.log("Hello, bob!")` — the entire application.
- **`package.json`**: No external dependencies. `npm start` maps to `node index.js`.
- **`.claude/settings.json`**: Registers the `SessionStart` hook.
- **`.claude/hooks/session-start.sh`**: Runs on session start in remote Claude Code environments (`CLAUDE_CODE_REMOTE=true`). Automatically installs dependencies for any of these manifests if present: `package.json`, `requirements.txt`, `pyproject.toml`, `Cargo.toml`, `go.mod`, `Gemfile`.

## Development Workflow

- No build step — plain Node.js, no transpilation or bundling.
- No linter or formatter is configured.
- No test framework is set up; `npm test` fails by design.
- To add a dependency: `npm install <package>` — it will appear in `package.json` and `package-lock.json`.

## Conventions

- The working branch for documentation/AI tasks is `claude/claude-md-docs-xioka5`.
- Keep changes minimal and focused; this project is intentionally a scaffold.
- Commit `package-lock.json` if dependencies are added, but do not commit it while it remains empty/unused.
