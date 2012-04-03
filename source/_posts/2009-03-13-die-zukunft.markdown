---
layout: post
title: Die Zukunft
categories:
- Articles
- Design
- Essay
- Meta
- Web
status: publish
type: post
published: true
meta:
  _edit_last: '1'
  img: relaunch
---
In der letzen Zeit hat sich das Lumenlog gewandelt. Wo ich vorher einmal die Woche einen längere Artikel gepostet habe, werden die wichtigeren Artikel jetzt förmlich von Links erdrückt. Habt ihr mal getestet, wie weit unten der letzte "richtige" Artikel steht? Man muss fast die gesamte Seite herunterscrollen. Das sollte nicht so sein.

Trotzdem mag ich diese Links. Mit ihnen kann ich euch Sachen zeigen, über die ich keinen vollwertigen Artikel verfassen möchte. Außerdem setzt das Lumenlog dank der Links keinen Staub an, wenn ich gerade keine Zeit habe, längere Texte zu schreiben. 
Ich denke, es wird Zeit, hier ein bisschen was Neues zu probieren. Eine Trennung von Links und Artikeln... ein Design, dass es einfach macht, die vollwertigen Artikel zu sehen, das aber auch die Links nicht außen vor lässt.

<h3>Technik & Verständnis</h3>

Dazu kommt noch eine weitere Sache, die mich momentan bei der ganzen Technik des Blogs etwas ärgert: ich weiß nicht so genau, was passiert. Wir haben da dieses WordPress, das alles kann, was man sich vorstellen kann und hunderte von PHP-Dateien umfasst, die miteinander interagieren. Und dann kommt noch dieses Theme hinzu, das auf <a href="http://getk2.com/">K2</a> basiert. Nochmal so eine arkane Ansammlung von PHP-Code für sich. Beim Umzug auf diese neue Domain habe ich zumindest mal das Stylesheet auf eines reduziert... aber trotzdem. Jede Funktion, die ich hier haben möchte, ist eine seltsame Hackerei von PHP-Code, den ich nicht vollständig durchschaue. K2 macht so viel, da passieren so viele Dinge, die ich aller Wahrscheinlichkeit nie brauchen werde...
Schauen wir uns mal an, wie ich die Links umgesetzt habe. Eigentlich sind sie normale Posts, die einer bestimmten Kategorie angehören. In der ersten Zeile haben sie einen Link, der per CSS wie eine Überschrift gestaltet wird. Der eigentliche Titel des Posts, der genauso heißt wie der Link, wird versteckt. Das heißt die Posts haben einmal einen Titel, der auch so heißt, den ihr aber nicht seht, und einen Link, der als Pseudo-Titel fungiert. Ein wenig um die Ecke gedacht, nicht? Alles nur, weil ich das Theme nicht durchschaue und daher auch keine neue Funktionen einbauen kann.

Auch ist das HTML, das am Ende ausgegeben wird ist, vorsichtig ausgedrückt, unübersichtlich. Die Artikel verstecken sich ungefähr in der vierten Unterebene des Markups. Und das CSS, mit dem das alles gestylt ist, ist auch eher voluminös. Um die 2000 Zeilen Code zu verwalten ist nicht so meine Lieblingsbeschäftigung. Vor allem nicht, wenn ein Großteil des Codes Dinge stylt, die ich nicht brauche. Flickr-Bilder? Habe ich hier nicht! 

<h3>Server, WordPress & Chyrp</h3>

Ich denke, es wird Zeit, mal reinen Tisch zu machen. Diese ständige Ungewissheit, was eigentlich alles passiert, geht mir wirklich auf die Nerven. Die erste Hälfte ist ja schon geschafft: der Server ist von Hand betreut und aufgesetzt, die ganze Konfiguration habe ich selbst eingerichtet. Ich habe zwar keine vollständige, aber doch zumindest eine gewisse Vorstellung von de Server-Architektur. Nun fehlt noch die Blogging-Engine, die Text aus der Datenbank holt und in HTML ausgibt. Ist WordPress wirklich das Richtige? Ich weiß es nicht. In letzter Zeit habe ich ein Auge auf <a href="http://chyrp.net/">Chyrp</a> geworfen. Chyrp bezeichnet sich selbst als "leichtgewichtige Blogging-Engine" – recht genau das, was ich brauche.
Dazu kommt noch eine Templating-Engine, die mir ein bisschen zugänglicher vorkommt als die von WordPress. Ich möchte eigentlich keinen PHP-Code schreiben müssen, nur um mir den Titel eines Posts auszugeben. 
Was mir an Chyrp auch sehr gut gefällt, ist die Möglichkeit, grundsätzlich verschiedene Arten von Inhalt zu haben. Da gibt es Links, Texte, Bilder, Videos und so weiter. Für das Lumenlog dürften hauptsächlich zwei wichtig sein: Text und Link. Text sind natürlich die Artikel, Links sind – nun, Links, Treibgut aus dem Weltmeer des Internets.

<h3>Design & Zukunft</h3>

Und wie soll das jetzt genauer aussehen? Nun, da bin ich mir nicht so sicher. Ich spiele mit dem Gedanken, die Posts auf der Startseite nur mit ihrem Titel und Untertitel anzuzeigen, jeweils begleitet von einem Bild. Die Links bekommen eine eigene Spalte und sind demnach klar von den Artikeln getrennt. Ja, das kann man sich jetzt schwer vorstellen. Um euch ein bisschen eine Richtung zu zeigen, schlage ich vor, dass ihr mal einen Blick auf das  <a href="http://shauninman.com/">Blog von Shaun Inman</a> werft. Ein tolles Design. Einfach, funktional und ausgesprochen elegant. Mir persönlich gefällt der Mangel an Farbe nicht so gut, aber es ist ja nicht mein Blog. Wenn man sich auch ein wenig für Web Design interessiert, kann man sich auch den Quellcode der Seite anschauen – sauberer geht's nicht. So einen aufgeräumten Code habe ich noch nicht gesehen. Für einen Lacher kann man dann mal mit dem Quellcode des Lumenlogs vergleichen. Chaotischer geht's nicht mehr... nein, das nehme ich zurück. Aber es ist schon recht voll, das ganze.

Das sind meine Gedanken zum Lumenlog. Ich bin mir noch nicht sicher, was genau passieren soll. Umzug auf Chyrp? Neues Design? Abschaffung der Links? Wenn ihr Vorschläge habt, immer rein in die Kommentare.
