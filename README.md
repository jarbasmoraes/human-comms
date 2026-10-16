# human-comms

[![skills.sh](https://skills.sh/b/jarbasmoraes/human-comms)](https://skills.sh/jarbasmoraes/human-comms)

An agent skill for clear messages, durable reports, and evergreen notes.
Make the opening understandable in 15 seconds while preserving the context,
evidence, and reasoning that future readers need.

## The rules, in short

- **Lead with the answer.** Make the opening understandable in 15 seconds:
  what happened, why it matters, and whether the reader needs to act.
- **Match the format to the purpose.** Keep operational updates brief. Give
  durable reports context and evidence. Build evergreen notes around one
  reusable idea, including when it applies and when it does not.
- **Make facts easy to scan.** Use bullets for parallel items, numbered lists
  for steps, tables for comparisons, and prose for connected explanations.
  Group long lists instead of dropping important facts.
- **Make questions and blockers visible.** Put them on their own labeled
  line. Explain the options, practical trade-offs, and your recommendation.
- **State authorized defaults.** When a reply is needed, explain what happens
  without one. Silence never grants missing approval.
- **Write plainly for the audience.** Use useful technical terms and preserve
  identifiers needed to locate or reproduce the work. Explain unfamiliar terms.
- **Write like Zinsser.** Cut filler and unnecessary repetition. Prefer active
  verbs and specific words. Avoid flattery, slogans, and dash-heavy prose.
- **Challenge assumptions with reasons.** Do not agree automatically. Explain
  unsupported premises without manufacturing disagreement.
- **Keep evidence and commitments distinct.** Separate verified facts, reports,
  inferences, and unknowns. A proposal is not an approved decision, and planned
  work is not completed work. Never invent reassurance or verification.
- **Preserve actionable facts.** Commands, paths, URLs, names, dates, units,
  and numerical values survive editing. Simplify around them.
- **Use the reader's language.** A Portuguese conversation gets a Portuguese
  update, even when the code and logs are in English.
- **Make durable writing self-contained.** Include relevant dates, scope,
  sources, reasoning, limits, and conditions for reconsideration. Never invent
  missing dates or leave essential evidence only available on request.
- **Maintain records according to their purpose.** Add dated corrections to
  historical reports. Revise evergreen explanations as understanding improves,
  keeping material changes traceable.
- **Use references when they help.** Use F for findings, D for decisions, O for
  options, R for risks, Q for questions, and A for actions. Keep IDs stable
  within their scope. Skip them when simple prose is enough.
- **Bound clutter, not information.** Aim for under 100 words for routine
  status updates and under 150 for questions or error reports. Keep necessary
  facts and evidence even when they require more space.

## What it changes

| Mode | Best for | Result |
| --- | --- | --- |
| Operational | Status, errors, questions, blockers | Outcome first, impact, clear next action |
| Durable record | Investigations, handoffs, decisions | Dated context, evidence, rationale, review conditions |
| Evergreen note | Reusable knowledge | One idea, mechanism, applicability, exceptions |

Use optional F/D/O/R/Q/A references when readers need to discuss or track items.
Keep evidence status separate from action status. A recommendation is not an
approved decision, and silence does not grant permission.

## Install

**One-liner** — detects which agent CLIs you have (Claude Code, Pi, Codex,
opencode, Hermes) and installs into each:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/jarbasmoraes/human-comms/main/install.sh)
```

Or from a clone: `./install.sh` (add `--all` to force-install into every
supported agent). Re-running is idempotent, so it doubles as the update path.

Alternatively, use the [skills](https://github.com/vercel-labs/skills) CLI, which detects your
agent and puts the files in the right place:

```bash
npx skills add jarbasmoraes/human-comms
```

Add `-g` to install globally instead of into the current project.

### Manual

Or clone into your agent's skills directory.

**Claude Code (all projects):**

```bash
git clone https://github.com/jarbasmoraes/human-comms.git ~/.claude/skills/human-comms
```

**Claude Code (one project):**

```bash
git clone https://github.com/jarbasmoraes/human-comms.git .claude/skills/human-comms
```

**Pi:**

```bash
git clone https://github.com/jarbasmoraes/human-comms.git ~/.pi/agent/skills/human-comms
```

The directory name must be `human-comms` to match the `name` field in
`SKILL.md`. Restart your agent session to pick it up.

## Use

Ask your agent to apply the skill, or let it select the skill from its description.
Automatic loading depends on your agent's skill support and configuration.

- "Use human-comms to summarize the migration status."
- "Write a durable incident report using human-comms."
- "Turn this lesson into an evergreen note using human-comms."
- "Review this draft and add stable references for the decisions."

The skill infers the mode from the destination and purpose. Simple responses
stay simple. Technical terminology follows the audience, and material facts
survive editing. Reports retain evidence; historical conclusions receive dated
corrections. Evergreen explanations evolve as understanding improves.

The core protocol is in [`SKILL.md`](./SKILL.md). Examples in [`examples/`](./examples)
are loaded only when relevant. The shell installer copies both the core and examples.
The existing release workflow manages the version field automatically.

## Compatibility

Standard skill format: YAML frontmatter with `name` and `description`, plus
Markdown instructions. Works with Claude Code, Pi, and any agent that reads
`SKILL.md` files. No dependencies, no install step, nothing to build.

## License

MIT. See [`LICENSE`](./LICENSE).
