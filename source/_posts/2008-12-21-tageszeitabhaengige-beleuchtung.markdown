---
layout: post
title: Tageszeitabhängige Beleuchtung
categories:
- Articles
- Beleuchtung
- Essay
- Featured
- NifSkope
- Oblivion
- Scripting
- Texturieren
status: publish
type: post
published: true
meta: {}

---
Sowohl Oblivion als auch Morrowind ignorieren die Veränderung der Tageszeit, es gehen keine Lichter an oder aus wenn es Nacht wird. Dabei ist das doch recht einfach umzusetzen und bringt einen großen Zuwachs an Lebenendigkeit, an Atmosphäre mit sich. Außerdem ermöglicht ein Tag-Nacht-Wechsel viel abwechslungsreichere Interiors. Diese können nämlich je nach Tageszeit von bläulichem Tageslicht oder von orangenem Feuerschein beleuchtet sein. Ein nächtliche Siedlung mit orangenen Fenstern ist gleich viel lebendiger als eine scheinbare Totenstadt mit nachts unbeleuchteten Fenstern. Eine Variable Beleuchtung beschränkt sich allerdings nicht auf einen Wechsel von Tag und Nacht - nein, auch das Wetter kann berücksichtigt werden. Auch bei Nebel oder Sturm wirken beleuchtete Fenster sehr dramatisch.

Und wie baut man einen solchen Wechsel nun in seine Mod ein? Mir sind dazu drei Möglichkeiten bekannt, die ich hier vorstellen werde. Ein Tutorial, das genauer die Methode zwei vorstellt, ist auch in Arbeit.
<!--more-->
<h4>Methode 1: Lokales Script</h4>
Dies ist die offensichtlichste und einfachste Methode, einen Wechsel von Tag und Nacht umzusetzen. Man lässt auf jedem Objekt, das von der Tageszeit beeinflusst werden soll, ein entsprechendes Script laufen. Dieses muss nur die Tageszeit festellen und je nachdem den "enable" oder "disable"-Befehl auslösen. Dieses könnte dann ungefähr so aussehen:

<code>scn LightingScript
begin gamemode
; Tag und nebelig -&gt; ein
if ( gamehour &gt;= 6 || gamehour &lt; 21 ) &amp;&amp; ( GetIsCurrentWeather Fog == 1 )
enable
endif</code>

<code>; Tag und schön -&gt; aus
if ( gamehour &gt;= 6 || gamehour &lt; 21 ) &amp;&amp; ( GetIsCurrentWeather Fog != 1 )
disable
endif</code>

<code> </code>

 

<code>; Nacht -&gt; ein
if gamehour &gt;= 21 || gamehour &lt; 6
enable
endif
end</code>

Natürlich muss man gegebenenfalls "disable" und "enable" vertauschen, je nach Anwendung. Eine unbeleuchtetes Fenster zum Beispiel muss ja tagsüber enabled sein.
Der große Nachteil dieser Methode ist jedoch offensichtlich: sie frisst Performance. Denn auf jedem Objekt läuft ein Script, das in jedem einzelnen Frame berechnet werden muss. Und eigentlich nur zweimal am Tag etwas tun soll...
Dazu kommt ein zweites Problem. Man muss für jedes Objekt eine jeweilige Tag- und Nacht-Version erstellen. Das ist zum Beispiel bei den Kerzen recht nervig. Oblivion liefert ja schon ausgeschaltete Versionen mit - man muss jedoch trotzdem nochmals eigene Varianten herstellen, was doch ein wenig unelegant ist.


<h4>Methode 2: Globales Script und Parents</h4>
[caption id="attachment_335" align="alignleft" width="400" caption="Diese Methode wird bei Eleyon eingesetzt."]<a href="http://lumenpage.com/blog/wp-content/uploads/2008/12/eleyon20jpg.jpeg"><img src="http://lumenpage.com/blog/wp-content/uploads/2008/12/eleyon20jpg-400x250.jpg" alt="Diese Methode wird bei Eleyon eingesetzt." title="eleyon20jpg" width="400" height="250" class="size-thumbnail wp-image-335" /></a>[/caption]Jedes Objekt in Oblivion kann eine Parent-Referenz haben, dessen Enable- und Disable-Status es teilt. Auf diesem Verhalten basiert die zweite Methode. Es wird nur jeweils ein "Meister-Objekt" für Tag und Nacht definiert.
Noch eleganter ist natürlich die Variante mit nur einer Referenz: wenn man bei den Children den Haken bei "Set Enable State to Opposite of Parent" setzt, wird der Status umgedreht.
Hat man sich nun seine Meister-Referenz(en) gebaut (die unbedingt auf "Persistent Reference" gestellt werden müssen), muss man nur noch ein simples QuestScript schreiben, das sie jeweils enabled und disabled. Das Schöne dabei ist die Variable <a href="http://cs.elderscrolls.com/constwiki/index.php/FQuestDelayTime">fQuestDelayTime</a>, die festlegt, wie oft ein QuestScript durchläuft. So wird es nicht ständig ausgeführt, sondern kann sich alle paar Minuten einschalten und die Tageszeit prüfen.
Somit ist der große Vorteil dieser Methode der Performancegewinn durch das einzelne, nicht in jedem Frame laufende Quest-Script.
Praktischerweise kann man mit dieser Methode jedes beliebige Objekt einfach tageszeitabhängig machen. Man muss keine neuen Objekte erstellen, eine kleine Einstellung bei "Enable Parent" genügt. So kann man auch schnell mal einen Schmetterling nur tagsüber fliegen lassen und ihn nachts durch Glühwürmchen ersetzen.
Der Nachteil ist jedoch eine gewisse Mehrarbeit beim Platzieren von Objekten, da jeder einzelnen Referenz der passende Parent zugewiesen werden muss. Die Abhängigkeit von Parents macht diese Methode auch unflexibler - alles wird zur gleichen Zeit verändert. Das möchte man allerdings meistens auch genau so haben. Eine Pause zwischen dem Disablen der Tagesfenster und dem Enablen der nächtlichen Fenster wäre recht unschön.
<h4>Methode 3: Emissive Color</h4>

<a href="/images/articles/2008/12/texians.png" class="img-link-block"><img class="size-thumbnail wp-image-309" title="texians" src="/images/articles/2008/12/texians-400x250.png" alt="Die Fenster in Chorrol, mit Texians Methode beleuchtet." width="400" height="250" /></a>

Diese interessante, in <a href="http://www.oblivionmodwiki.com/index.php?title=Texian's_Window_Lighting_System">Texian's Window Lighting System</a> eingesetzte Methode kommt ganz ohne Scripts aus. Sie basiert auf dem Zusammenspiel der Emissive Color einer NiTriStrip und der Glowmap. Die <a href="http://cs.elderscrolls.com/constwiki/index.php/Working_With_Nifs_301_:_Properties_Breakdown">Emissive Color</a> bestimmt das Schimmern, das zunimmt, je weniger Licht auf ein Objekt fällt. Bei dieser Methode wird diese nun auf Orange gesetzt, so dass die Fenster im Dunkeln orange schimmern. Eine Glow-Map legt nun fest, welche Teile des Fensters von diesem Effekt betroffen sind - leuchtende Fensterrahmen sind nicht unbedingt erwünscht.

Auf diese Weise kann man Fenster nachts leuchten kann, ohne zu scripten, ohne neue Nifs zu bauen, die nur aus den Fenstern bestehen, ohne auf die Veränderung des Wetters zu achten und so weiter. Offensichtlich ist diese Methode nur für Fenster anwendbar, Lichtquellen müssen immernoch von Hand platziert und geskriptet werden. 
Worin ein großer Nachteil dieses Vorgehens liegt. Denn wenn die Fenster mit ihrer Emissive Color leuchten, strahlen sie kein Licht an ihre Umgebung ab. So bleiben nahe Hauswände im Dunkeln, man sieht keinen Lichtschein aus Fenstern kommen. Daher finde ich die Beleuchtung dieser Methode, so genial sie auch ist, doch ein wenig unrealistisch und schwach. Ich bevorzuge das Zusammenspiel von veränderten Fenstertexturen und Lichtquellen. Das wirkt viel leuchtender und lebendiger.

<strong>Und ihr? Welche Methode verwendet ihr? Oder haltet ihr eine tageszeitabhängige Beleuchtung für sinnfreie Spielerei?</strong>
