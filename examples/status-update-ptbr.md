# Example: status update in Portuguese

Demonstrates: **write in the reader's language** — the conversation is in
PT-BR, so the update is in PT-BR, even though the code, the logs, and the
error messages are all in English. Also: **facts survive verbatim** — the
command and the number stay exact.

## Before

> The migration script executed successfully. I ran
> `npm run migrate -- --batch-size 500` against the staging database and all
> 18,342 rows were processed. There was a transient connection timeout during
> batch 12 which triggered the retry logic, but idempotency checks confirmed
> no duplicate writes occurred. Proceeding to production requires your
> approval per the deployment policy.

*(the user had been writing in Portuguese the whole conversation)*

## After

> A migração em staging terminou sem erros e está pronta para produção.
>
> - Rodei `npm run migrate -- --batch-size 500` e as 18.342 linhas foram processadas.
> - Houve uma queda de conexão no meio, mas o script retomou sozinho e verifiquei que nenhuma linha foi duplicada.
>
> **Pergunta:** posso rodar em produção hoje à noite?
> Se não tiver resposta até as 18h, deixo para amanhã de manhã.

## Why it works

The reader asked in Portuguese and gets the answer in Portuguese. The command
`npm run migrate -- --batch-size 500` and the row count survive exactly as
they are — only the explanation around them changed language. The question
gets its own labeled line and a default action with a deadline.
