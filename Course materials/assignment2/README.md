1. Endre branch til dev | staging | prod
2. Push endring til branchen -> dette vil trigge validate action. Velger ved en push da dette betyr en endring som må valideres.
3. Hvis denne var successfull -> create PR "staging <- dev" (da manuelt)
4. Den PR vil aktivere en deploy som kjører plan & apply for hvert workspace i dev
   - Utenom prod da her trengs det manuell godkjenning
5. ---||---, pkt.1-4
6. PR "prod <- staging"
7. Til slutt sitter man igjen med en full deployed (og godkjent av testene) infrastruktur i prod branchen

3 workspaces "dev | stage | prod". Kobles opp mot hver sin branch.
1. Starter i default-workspace.
2. Oppretter branch "dev | staging | prod".
3. Gjøre kode-endringer i branchen. Ved push vil dette trigge en validate-action i den gjeldende branchen.
4. Hvis denne var successfull -> create PR "main <- den gjeldende branchen" (da manuelt).
5. PR vil trigge en deploy-action som plan & apply'er infrastrukturen til dev-workspace.
6. Slette den gjeldende branchen.
7. Repeat (i forhold til neste workspace, da stage).
8. [...]
9. I prod-workspacen så trengs det en godkjennelse i pkt.4!

Workspace:
default -> dev    (dev-branch)
            |
            v
default -> stage  (staging-branch)
            |
            v
default -> prod   (prod-branch)
            ||
      Ferdig infrastruktur