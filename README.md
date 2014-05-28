Vous utilisez AWESOME avec UBUNTU ou DEBIAN et vous rencontrez des problèmes pour configurer 2 écrans ?
Ou tout simplement vous cherchez un script pour configurer à la volée les écrans avec AWESOME ?
Voilà 'awesome-xrandr' est la pour ça :)

Un script bash qui utilise xrandr pour configurer 2 écrans.


**LE DÉVELOPPEMENT EST AU TOUT DEBUT.**


**Pour l'instant le script régle juste mon cas specifique :**

Je suis sous Ubuntu 12.04 et j'utilise AWESOME comme gestionnaire de fenêtres;
quand je branche un deuxième écrans en VGA il me le met systematiquement à gauche à chaque demarrage.

Comme j'en avais marre de executer les mêmes commandes à chaque démarrage j'ai fait ce script.


**Dans mon script je tiens compte aussi de ma propre configuration _awesome_ :**

Au demarrage de *awesome* je charge des applets comme *nm-applet* et à chaque fois que je recharge *awesome* (comme quand j'execute *xrandr*) *nm-applet* est dupliqué (ça peut sans doute arriver à d'autres applets).
Pour eviter ça j'ai mis en place un système avec deux modes de config *awesome* :
* **mod-clean** config à charger au demarrage
* **mod-test** config pour effectuer des tests
Pour vous permettre de comprendre le fonctionnement de mes deux modes de config *awesome* et eventuellement adopter cette solution vous pouvez voir mon dépôt *github* [awesome-switch-mode](https://github.com/massipasquesi/awesome-switch-mode)


Je vais faire en sorte de rendre mon script plus générique et qui marchent pour toute personne utilisant awesome et ubuntu ou debian.

**_allez Massi au boulot_ !!! :D**
