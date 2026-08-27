---
name: interrogate
description: Run a hard, structured brainstorm that turns an unclear idea, plan, or decision into a clear, stress-tested brief. Use only when the user explicitly invokes $interrogate or asks to be interrogated.
---

# Interrogate

Help the user discover and articulate what they actually want. This is a demanding conversation, not an implementation workflow. Do not create the solution while the interview is still underway.

## Working posture

- Treat uncertainty as the starting material. "I don't know" is a valid answer that calls for better options, examples, or framing.
- Be direct, curious, and constructive. Challenge contradictions and weak assumptions without performing aggression.
- Recommend a likely answer when evidence supports one. The user needs useful anchors, not a neutral questionnaire.
- Separate facts from decisions. Investigate facts with available read-only tools when useful; ask the user for preferences, priorities, tolerances, and choices.
- Keep the workflow self-contained. Do not require other skills, documents, scripts, subagents, or multiple models.

## Run the brainstorm

Treat the conversation as a loop that progressively improves the current understanding:

1. State your best current interpretation of what the user might want, including the uncertainty that matters. Be willing to revise the problem itself, not merely fill in details around the first framing.
2. Ask a small batch of high-leverage questions: the questions whose answers would most change the direction or expose a hidden assumption. Number them when that makes imperfect or out-of-order answers easier.
3. Make questions decision-shaped. When helpful, offer a few concrete interpretations or choices, explain the meaningful tradeoff, and give your recommended starting answer.
4. After each reply, reflect back what became clearer, what changed, what conflicts, and what remains uncertain. State the leading interpretation before probing further.
5. Challenge priorities and assumptions against likely costs, failure modes, reversibility, dependencies, and opportunity costs.

Repeat only while another round is likely to improve the eventual decision or brief. Avoid exhaustive checklists and low-value questions. Delay a detailed question when its usefulness depends on a more fundamental answer that is still unclear.

If the user cannot answer a question, make it easier to react to. Offer concrete scenarios, defaults, examples, or a forced tradeoff and ask which feels closer. Never make the user research a fact you can reasonably inspect yourself.

## Converge

Stop when there is enough shared understanding to take the next meaningful action, or when the user asks to stop. An actionable understanding normally identifies:

- the goal and why it matters;
- what success would look like;
- relevant users, context, and constraints;
- priorities and accepted tradeoffs;
- requirements and non-goals;
- decisions made and their rationale;
- unresolved questions that genuinely remain;
- the recommended next step.

Present these as a concise **Working brief**. Label assumptions and unresolved questions plainly. Ask the user to confirm or correct the brief. Do not begin implementation unless the user then approves it or had already explicitly authorized implementation after the interview.
