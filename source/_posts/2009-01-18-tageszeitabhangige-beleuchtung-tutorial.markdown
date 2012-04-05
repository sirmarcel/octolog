---
layout: post
title: Tageszeitabhängige Beleuchtung
categories:
- Articles
- Beleuchtung
- Modding
- NifSkope
- Oblivion
- Scripting
- Texturieren
status: publish
type: post
published: true
meta:
  _edit_last: '1'
  sub: Tutorial
  img: beleuchtung
external-url: http://lumenpage.com/blog/wp-content/uploads/2009/01/eleyon08.jpg
---
Nachdem wir ja schon zu dem Schluss gekommen sind, das tageszeitabhängige Beleuchtung nicht nur ein langes Wort, sondern auch eine gute Sache ist, beenden wir dieses Thema mit einem Tutorial. Das hier ist die Methode, die ich für Eleyon verwende. Viel Spaß beim Einbauen!

Bevor wir im CS anfangen können, brauchen wir zuerst die passenden Modelle. Für die Kerzen liefert uns Oblivion schon ausgeschaltete Versionen mit, bei den Fenstern ist die nicht so einfach. Hier muss man seine Photoshop oder Gimp-Kenntnisse herausholen. Darauf gehe ich hier nicht näher ein, das würde wohl den Rahmen dieses Tutorials sprengen. Ein orangenes Einfärben der nächtlichen Version und ein wenig mehr Sättigung sind in den meisten Fällen auch schon ausreichend. Das Internet ist für Tutorials zu diesem Thema ein sehr gute Quelle.

Gut, die in Eleyon benutzten Fenstertexturen stammen aus den Fenstern der Dementia-Hütten von Shivering Isles und sehen so aus:
<!--more-->
[caption id="attachment_310" align="aligncenter" width="500" caption="Die Fenster von Eleyon. Links die Version für den Tag, rechts die beleuchtete für die Nacht."]<a href="http://lumenpage.com/blog/wp-content/uploads/2008/12/fenster.png"><img class="size-medium wp-image-310" title="fenster" src="http://lumenpage.com/blog/wp-content/uploads/2008/12/fenster-500x312.png" alt="Die Fenster von Eleyon. Links die Version für den Tag, rechts die beleuchtete für die Nacht." width="500" height="312" /></a>[/caption]

Nun kommen wir zu den benötigten Meshes - man muss die Fenster ja unabhängig von dem Rest des Hauses enablen und disablen können. Der Dank für diese Methode geht an Haldor und Trebron vom Orden-Team.
Also, zuerst suchen wir uns das NiTriStrip, in dem die Fenster liegen. Dieses NiTriStrip klicken wir nun rechts an und wählen "Copy Branch".

[caption id="attachment_312" align="alignnone" width="400" caption="Und &quot;Copy Branch&quot;..."]<a href="http://lumenpage.com/blog/wp-content/uploads/2008/12/copybranch.png"><img class="size-thumbnail wp-image-312" title="copybranch" src="http://lumenpage.com/blog/wp-content/uploads/2008/12/copybranch-400x250.png" alt="Und &quot;Copy Branch&quot;..." width="400" height="250" /></a>[/caption]

Dann löschen wir es und speichern das Mesh als Grundmesh des Hauses ab.

[caption id="attachment_319" align="alignnone" width="400" caption="Und weg mit den Fenstern!"]<a href="http://lumenpage.com/blog/wp-content/uploads/2008/12/rembranch.png"><img class="size-thumbnail wp-image-319" title="rembranch" src="http://lumenpage.com/blog/wp-content/uploads/2008/12/rembranch-400x250.png" alt="Und weg mit den Fenstern!" width="400" height="250" /></a>[/caption]

[caption id="attachment_313" align="alignnone" width="400" caption="Speichern als Variante ohne Fenster..."]<a href="http://lumenpage.com/blog/wp-content/uploads/2008/12/saveasnowindow.png"><img class="size-thumbnail wp-image-313" title="saveasnowindow" src="http://lumenpage.com/blog/wp-content/uploads/2008/12/saveasnowindow-400x250.png" alt="Speichern als Variante ohne Fenster..." width="400" height="250" /></a>[/caption]

Danach einen Rechtsklick auf das mit einer Null markierten NiNode und "Paste Branch".

[caption id="attachment_318" align="alignnone" width="400" caption="Paste Branch..."]<a href="http://lumenpage.com/blog/wp-content/uploads/2008/12/paste.png"><img class="size-thumbnail wp-image-318" title="paste" src="http://lumenpage.com/blog/wp-content/uploads/2008/12/paste-400x250.png" alt="Paste Branch..." width="400" height="250" /></a>[/caption]

Damit fügen wir die Fenster wieder ein. Nun löschen wir alle anderen NiTriStrips außer dem Fenster. Und dazu noch das bhkCollisionObject.

[caption id="attachment_321" align="alignnone" width="400" caption="Und auch kein Collision Object mehr..."]<a href="http://lumenpage.com/blog/wp-content/uploads/2008/12/nocobject.png"><img class="size-thumbnail wp-image-321" title="nocobject" src="http://lumenpage.com/blog/wp-content/uploads/2008/12/nocobject-400x250.png" alt="Und auch kein Colission Object mehr..." width="400" height="250" /></a>[/caption]

Damit sind wir beinahe fertig - wir müssen nur noch die Kollisionsberechnung ausschalten, was wir tun, indem wir erst unter "View" die Block Details sichtbar machen, die BSXFlags anklicken und auf das kleine Fähnchen nach uint klicken. Dann schalten wir "Enable Collision" aus und fertig.

[caption id="attachment_316" align="alignnone" width="400" caption="Enable Collision wird ausgeschaltet."]<a href="http://lumenpage.com/blog/wp-content/uploads/2008/12/enablecol.png"><img class="size-thumbnail wp-image-316" title="enablecol" src="http://lumenpage.com/blog/wp-content/uploads/2008/12/enablecol-400x250.png" alt="Enable Colission muss aus..." width="400" height="250" /></a>[/caption]

Nun können wir endlich die passenden Texturen zuweisen. Die Tagesvariante kann entweder ihre vorhandenen Texturen behalten oder eigene bekommen. Normalerweise ist die Standard-Textur aber vollkommen geeignet, nur für die Nacht muss sie einen orangenen Farbton und eine höhere Sättigung erreichen.
Was nun noch fehlt ist die Emissive Color, die für die Tagesfenster auf Schwarz belassen werden kann.
Damit haben wir die Fenster für den Tag fertig, jetzt weisen wir ihnen noch die nächtlichen Texturen zu und speichern sie separat ab. Um die Fenster auch aus der Ferne leuchtend erscheinen zu lassen, setzen wir die Emissive Color auf Weiß (#ffffff).

[caption id="attachment_315" align="alignnone" width="400" caption="Die Emissive Color für den Tag..."]<a href="http://lumenpage.com/blog/wp-content/uploads/2008/12/emissivecolorday.png"><img class="size-thumbnail wp-image-315" title="emissivecolorday" src="http://lumenpage.com/blog/wp-content/uploads/2008/12/emissivecolorday-400x250.png" alt="Die Emissive Color für den Tag..." width="400" height="250" /></a>[/caption]

Jetzt sollten wir drei verschiedene Meshes erzeugt haben: eines ohne Fenster, eines nur mit den unbeleuchteten und eines mit den beleuchteten Fenstern. Bevor wir nun ins Construction Set springen und dort weitermachen, gönnen wir uns eine kleine Pause. Trinken einen Schluck, holen einmal tief Luft.

Okay, zuerst binden wir die Meshes ein. Das sollte ja nicht allzu schwierig sein. Der Typ ist mehr oder weniger egal, das Haus auf jeden Fall als Static, die Fenster kann man auch als Activator einbinden. Macht aber für unsere Methode keinen Unterschied.
[caption id="attachment_429" align="alignnone" width="400" caption="Alle drei Meshes sind eingebunden"]<a href="http://lumenpage.com/blog/wp-content/uploads/2009/01/eingebunden.png"><img src="http://lumenpage.com/blog/wp-content/uploads/2009/01/eingebunden-400x250.png" alt="Alle drei Meshes sind eingebunden" title="eingebunden" width="400" height="250" class="size-thumbnail wp-image-429" /></a>[/caption]
Nun brauchen wir noch die "Meister-Referenzen", die als Parent für die Fenster fungieren. Dazu suchen wir uns irgendein Objekt, ich habe mal einen Activator genommen und machen eine neue Version von ihm, die wir passend bennen. Nun erstellen wir uns eine neue Interior-Zelle, in der wir später schnell die Referenzen wiederfinden können. Am Besten ist es, wenn diese Zelle einen Namen bekommt, der sie ganz an den Anfang des Alphabets befördert. So wie "000LightingCell" oder ähnliches. Nun ziehen wir unseren Activator zweimal in diese Zelle. Und klicken beide Referenzen an und geben ihnen einzigartige, leicht erkennbare IDs, zum Beispiel "XRefDay" und "XRefNight". Diese müssen allerdings, soweit ich weiß, mit einem Buchstaben beginnen. Auf keinen Fall dürfen wir vergessen, das Kreuz bei "Persistent Reference" zu machen.
[caption id="attachment_430" align="alignright" width="400" caption="Wir haben eine neue Zelle und eine neue Version des Straßenschildes von Anvil erstellt. In die Zelle haben wir zweimal das Schild gezogen und den beiden Referenzen jeweils eindeutige IDs gegeben. Auf keinen Fall \"Persistens References\" vergessen!"]<a href="http://lumenpage.com/blog/wp-content/uploads/2009/01/referenzen.png"><img src="http://lumenpage.com/blog/wp-content/uploads/2009/01/referenzen-400x250.png" alt="Wir haben eine neue Zelle und eine neue Version des Straßenschildes von Anvil erstellt. In die Zelle haben wir zweimal das Schild gezogen und den beiden Referenzen jeweils eindeutige IDs gegeben. Auf keinen Fall &quot;Persistens References&quot; vergessen!" title="referenzen" width="400" height="250" class="size-thumbnail wp-image-430" /></a>[/caption]
In dem Bild habe ich eine neue Zelle und eine neue Version des Straßenschildes von Anvil erstellt. In die Zelle wurde zweimal das Schild gezogen und den beiden Referenzen jeweils eindeutige IDs verpasst.

Bevor wir nun die Fenster und Häuser platzieren, müssen wir uns noch um das Scripting kümmern. Zuerst das Script, das ja recht simpel aufgebaut ist:

scn 0LightingScript

float fQuestDelayTime

begin gamemode

set fQuestDelayTime to 60

; Tag aber neblig -> Lichter an
if ( gamehour >= 6 || gamehour < 21 ) && ( GetIsCurrentWeather Fog == 1 )
    XRefDay.disable
    XRefNight.enable
;    Message "On."
endif

; Tag -> aus
if ( gamehour >= 6 || gamehour < 21 ) && ( GetIsCurrentWeather Fog != 1 )
    XRefDay.enable
    XRefNight.disable
;    Message "Off."
endif

; Nacht -> an
if gamehour >= 21 || gamehour < 6
    XRefDay.disable
    XRefNight.enable
;    Message "On."
endif

end

<strong>Die Wetterabfrage hat anscheinend, wie Trebron in einem Kommentar zum letzten Post mitteilte, im Zusammenspiel mit Wettermods Abstürze zur Folge. Kann das jemand bestätigen?</strong>

Dieses Script speichern wir nun als QuestScript und bauen uns einen passenden Quest dazu, den wir beliebig nennen und ihm das Script verpassen. Wollen wir die tageszeitabhängige Beleuchtung nun anschalten, müssen wir nur in der Konsole "StartQuest MeinQuestName" eingeben.
[caption id="attachment_431" align="alignnone" width="400" caption="Das Questscript wird eingebunden"]<a href="http://lumenpage.com/blog/wp-content/uploads/2009/01/questscript.png"><img src="http://lumenpage.com/blog/wp-content/uploads/2009/01/questscript-400x250.png" alt="Das Questscript wird eingebunden" title="questscript" width="400" height="250" class="size-thumbnail wp-image-431" /></a>[/caption]
Gut, jetzt binden wir unsere Beleuchtung endlich ein. Zuerst stellen wir ein Haus in die Landschaft, das noch keine Fenster hat. Dann klicken wir es doppelt an und schieben das aufgehende Fenster nach oben, so dass es über das Renderfenster herausragt.
[caption id="attachment_432" align="alignnone" width="400" caption="Das Haus steht!"]<a href="http://lumenpage.com/blog/wp-content/uploads/2009/01/hauseingebaut.png"><img src="http://lumenpage.com/blog/wp-content/uploads/2009/01/hauseingebaut-400x250.png" alt="Das Haus steht!" title="hauseingebaut" width="400" height="250" class="size-thumbnail wp-image-432" /></a>[/caption]
Nun ziehen wir unsere beiden Fenster in das Renderfenster und klicken das erste doppelt an und bewegen das Fenster nach oben. Das gleiche tun wir auch mit dem zweiten Fenster. Jetzt kann man auch den Grund sehen, warum wir die Fenster nach oben geschoben haben: wären sie weiter unten, würden sie vom wieder vom in den Vordergrund springenden Renderfenster verdeckt werden.
[caption id="attachment_433" align="alignnone" width="400" caption="So sind unsere Fenster dann angeordnet"]<a href="http://lumenpage.com/blog/wp-content/uploads/2009/01/fensteranordnung.png"><img src="http://lumenpage.com/blog/wp-content/uploads/2009/01/fensteranordnung-400x250.png" alt="So sind unsere Fenster dann angeordnet" title="fensteranordnung" width="400" height="250" class="size-thumbnail wp-image-433" /></a>[/caption]
Gut, nun haben wir unsere drei Fenster nebeneinander offen. Als erstes geben wir den Fenstern ihre passenden Parents, indem wir auf "Enable Parent" gehen, unsere Zelle auswählen und die passende Referenz auswählen. Nun fehlt nur noch die Positionierung. Dazu übertragen wir die Positionsdaten des Hausmeshes auf die jeweiligen Fenstermeshes. Dazu haben wir die Fenster alle nebeneinander geöffnet, das erspart viel Klickerei. Ein Hinweis noch an dieser Stelle: nach dem Einfügen (mit Strg + V) der letzten Zahl muss man noch einmal in ein anderes Feld klicken, damit auch dieser Wert übernommen wird. Danach schließen wir die drei Fenster und haben unser Haus erfolgreich mit nachts leuchtenden Fenstern ausgestattet!
[caption id="attachment_440" align="alignnone" width="400" caption="Die Parents werden gesetzt. Die leuchtenden Fenster müssen nachts angehen..."]<a href="http://lumenpage.com/blog/wp-content/uploads/2009/01/parents1.png"><img src="http://lumenpage.com/blog/wp-content/uploads/2009/01/parents1-400x250.png" alt="Die Parents werden gesetzt. Die leuchtenden Fenster müssen nachts angehen..." title="parents1" width="400" height="250" class="size-thumbnail wp-image-440" /></a>[/caption]
[caption id="attachment_435" align="alignnone" width="400" caption="Alle haben die gleichen Positionsdaten..."]<a href="http://lumenpage.com/blog/wp-content/uploads/2009/01/allegleich.png"><img src="http://lumenpage.com/blog/wp-content/uploads/2009/01/allegleich-400x250.png" alt="Alle haben die gleichen Positionsdaten..." title="allegleich" width="400" height="250" class="size-thumbnail wp-image-435" /></a>[/caption]
[caption id="attachment_436" align="alignnone" width="400" caption="Unser Haus hat Fenster!"]<a href="http://lumenpage.com/blog/wp-content/uploads/2009/01/hausmitfenstern.png"><img src="http://lumenpage.com/blog/wp-content/uploads/2009/01/hausmitfenstern-400x250.png" alt="Unser Haus hat Fenster!" title="hausmitfenstern" width="400" height="250" class="size-thumbnail wp-image-436" /></a>[/caption]
Bravo. Geschafft. Jetzt fehlt nur noch, dass unsere Fenster auch nachts Licht ausstrahlen, das die Umgebung beleuchtet. Dazu machen wir uns einfach eine neue Lichtquelle unter "Lights", die aussieht wie eine große Glühbirne und orange leuchtet. Von diesen Glühbirnen positionieren wir jeweils eine vor jedem Fenster und geben allen die Nacht-Referenz als Parent.
[caption id="attachment_437" align="alignnone" width="400" caption="In der Nacht gibt es auch Licht!"]<a href="http://lumenpage.com/blog/wp-content/uploads/2009/01/lichtvorfenstern.png"><img src="http://lumenpage.com/blog/wp-content/uploads/2009/01/lichtvorfenstern-400x250.png" alt="In der Nacht gibt es auch Licht!" title="lichtvorfenstern" width="400" height="250" class="size-thumbnail wp-image-437" /></a>[/caption]
Alle anderen Objekte, die von der Tageszeit abhängig sein müssen, können wir auch mit den Referenzen disablen und enablen. Nachts Schmetterlinge durch Glühwürmchen ersetzen, Kerzen ausgehen lassen... alles ganz einfach! Bei den Kerzen muss man einfach eine angeschaltete Version (unter Lights) und eine ausgeschaltete Version (unter Static/Lights) mit der oben erklärten Methode ineinander stellen und die passenden Referenzen verpassen. Schon haben wir ein bisschen mehr Realismus.
<a href="http://lumenpage.com/blog/wp-content/uploads/2009/01/tag.png"><img src="http://lumenpage.com/blog/wp-content/uploads/2009/01/tag-400x250.png" alt="tag" title="tag" width="400" height="250" class="alignnone size-thumbnail wp-image-442" /></a>
<a href="http://lumenpage.com/blog/wp-content/uploads/2009/01/nacht.png"><img src="http://lumenpage.com/blog/wp-content/uploads/2009/01/nacht-400x250.png" alt="nacht" title="nacht" width="400" height="250" class="alignnone size-thumbnail wp-image-443" /></a>
Jetzt sind wir aber wirklich fertig. Juhu!

<strong>Und, baut ihr das jetzt ein? Habt ihr eine bessere Methode? Habe ich gar einen Fehler gemacht? Kommentarfunktion nutzen, danke. ;-)</strong>
