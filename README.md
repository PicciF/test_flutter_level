# test_flutter_level


# TODO
* [x] Check API
* [x] Model creation
* [x] Rounting 
* [ ] Api methods
* [ ] Home Page and detail page

# BUG
* [ ] to fix pathprovider for web (no managed yet) 


# API
Ho riscontrato una problematica nella generazione del token per utilizzare le API.
La documentazione fornisce un link non funzionante per la generazione del token. 
Ho trovato una discussione su github in cui si evince un problema tecnico del fornitore delle api.
L`unica soluzione percorribile è stata quella di utilizzare il token inserito all interno dell url degli esempi di esecuzione delle chiamate api fornite nella documentazione.
(In un contesto reale bisognerebbe contattare il cliente per sapere come viene generato il token in quanto se quest ultimo venisse generato in modo dinamico, la soluzione da me applicata non funzionerebbe in modo solido e certo.)

# MODEL
Ho creato i modelli della singola specie serializzabilli in modo da aumentare la comodita di utilizzo e leggibilita.
Ho implementato gia i modelli utili in caso di di sviluppo della funzionalita bonus, in modo da fare un lavoro piu pulito e gia impostato bene.

# ROUTING
Nonostante all`interno di questa app ci siano solo due pagine, ho scelto di usare la libreria auto_routing poichè è quella che utilizzo solitamente quindi la conoosco bene e so già come impostare tutte le impostazioni.
La scelta è stata fatta anche perchè in caso di futuro sviluppo sarà più comodo aumentare il numero di pagine poichè la struttura del routing è gia definita.


