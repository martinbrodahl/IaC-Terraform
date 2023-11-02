The Terraform configuration uses 4 workspaces "default | dev | stage | prod". The default workspace are used as a starting point.During edits & configuration a branch will be made "dev | staging | prod" which correlates the workspace we are currently deveopling in.
The main branch are our base. Dvs. vi oppretter midlertidlige branches hvor vi gjør endringer, når jobben er ferdig så merger man dette med main, slik at main alltid har et (foreløpig) ferdig produkt.

1. Starter alltid med utgangspunkt i default-workspace.
2. Oppretter midlertidlig branch "dev | staging | prod". (da manuelt)
3. Gjøre kode-endringer i branchen. Ved push vil dette trigge en validate-action på den gjeldende branchen.
4. Hvis denne var successfull: create PR "main <- den gjeldende branchen" (da manuelt).
   - Hvis ikke successfull fortsetter man å gjøre kode-endringer og push'e dette helt til successfull validate-action.
5. PR vil trigge en deploy-action som plan & apply'er infrastrukturen til dev-workspace, ETTER at den gjeldende branchen successfully er merget sammen med main.
6. Slette den midlertidlige opprettede branchen (dette gjør man under PR), ettersom at vi er ferdige med arbeidet.
7. Repeat (i forhold til neste workspace, da stage, så prod).
8. [...]
9. I prod-workspacen så trengs det en godkjennelse i pkt.5 for å deploye infrastrukturen!

Dette implements a good CICD workflow with gradvis utvikling til et ferdigstående produkt. 
which is scalabe, secure and easy maintainable.

Slik er CICDen satt opp:
Workspace:
default -> dev    (dev-branch)
            |
            |          PR
            v
default -> stage  (staging-branch)
            |
            |          PR
            v
default -> prod   (prod-branch)
            ||
      Ferdig infrastruktur