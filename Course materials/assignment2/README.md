1. Endre branch til dev | staging | prod
2. Push endring til branchen -> dette vil trigge validate action. Velger ved en push da dette betyr en endring som må valideres.
3. Hvis denne var successfull -> create PR "staging <- dev" (da manuelt)
4. Den PR vil aktivere en deploy som kjører plan & apply for hvert workspace i dev
   - Utenom prod da her trengs det manuell godkjenning
5. ---||---, pkt.1-4
6. PR "prod <- staging"
7. Til slutt sitter man igjen med en full deployed (og godkjent av testene) infrastruktur i prod branchen