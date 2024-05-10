# test_flutter_level


# TODO
* [x] Check API
* [x] Model creation
* [x] Rounting 
* [x] Api methods
* [ ] Home Page and detail page

# BUG
* [X] to fix pathprovider for web (no managed yet) 


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

# PAGES
Ho aggiunto la schermata di splash in modo tale da completare la api iniziale la quale ha molti elementi.
Preferisco inserire il caricamento dei dati iniziali nella schermata splash piuttosto che nella home perchè suppongo sia un percorso migliore, avvio l`app, avviene il carimento delle risorse iniziali e poi quando sono all interno dell app ho le informazioni subito. 
Ho gia predisposto il codice per la login in quanto ho deciso di farla, di conseguenza mi viene più comodo strutturare il codice fin dallinizio prevedendo la login piuttosto di modificare successivamente.

Ho scelto di gestire la lista di speci vulnerabili come una lista infinita data la grossa mole di elementi, per non appesantire il caricamento e lo scroll ho deciso di impaginare gli elementi con un pagesize di 20, al termine dello scroll di questi 20 elementi vengono aggiungi alla lista che viene mostrata altri 20 elementi in automatico.

Nella home page ho messo la dimensione del testo che si adatta in automatico a seconda di quanto spazio ce, impostando un minimo di dimensione font per maggiore leggibilita. Ho messo anche un tooltip che mostra l intero nome scientifico solo in caso sia lungo piu di 30 caratteri e in caso sia su android, in modo da non dover per forza entrare nel dettaglio.

