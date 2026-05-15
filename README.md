# Modellazione e Verifica Formale di un Sistema di Interlocking Ferroviario

**Software Dependability – Project Work A.A. 2025-26 – Tema 1**  
Università degli Studi di Firenze – Prof. A. Fantechi

## Descrizione

Modellazione e verifica formale di un sistema di interlocking ferroviario mediante **NuXmv** (modelli SMV).

Il sistema gestisce quattro itinerari (A-B, A-D, C-B, C-D) e quattro scambi (s1–s4) in una semplice stazione ferroviaria, garantendo che treni su percorsi conflittuali non possano transitare contemporaneamente.

## Struttura del progetto

```
interlocking.smv          # Modello NuXmv del sistema
simulazioni/
  controllo_statico.cmd   # Verifica correttezza statica (check_fsm)
  01_sequenza_AD_poi_AB.cmd
  02_fallimento_e_retry_CB.cmd
  03_parallelo_AB_e_CD.cmd
  04_blocco_AB_da_AD.cmd
report.pdf                # Relazione finale
```

## Proprietà verificate

| Proprietà | Logica | Risultato |
|-----------|--------|-----------|
| Safety-1 – No-collision | CTL | Verificata |
| Safety-2 – No-derailment | CTL | Verificata |
| Liveness | CTL | Verificata |
| Fairness | LTL | Non verificata |

La proprietà di Fairness è falsa per limitazione intrinseca della specifica: la condizione `NOCONFLICT` è senza memoria e non garantisce assenza di starvation.

## Requisiti

- [NuXmv 2.1.0](https://nuxmv.fbk.eu/)

## Esecuzione

```bash
nuXmv interlocking.smv
nuXmv -source simulazioni/controllo_statico.cmd
nuXmv -source simulazioni/01_sequenza_AD_poi_AB.cmd
```
