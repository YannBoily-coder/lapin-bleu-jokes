
#
# Insultotron, sur une base du pipotron
#
# Author: kykoonn
# Base author: CrazyCat <crazycat@c-p-f.org>
# http://www.eggdrop.fr
# irc.zeolia.net #c-p-f
#
# Génère une phrase aléatoire qui veut
# dire tout et son contraire
# Basé sur le pipotron:
#   http://richard.geneva-link.ch/pipotron.html
#
# Usage:
#   !insultotron
#


namespace eval insultotron {
    set pip1 {"Espèce de gros con" "Espèce de petit salaud" "Espèce de vieux bâtard" \ 
    "Espèce de sale pédé" "Espèce de pauvre mec" "Espèce de vieil enculé" "Espèce de petite taffiole" "Espèce de gros fils de pute" "Espèce de grosse fiotte" "Espèce de pauvre mec" "Espèce de sous merde" }

    set pip2 {"de ta race," "de ta mère," "des forêts," \
    "qui pue," "débile," "assexué," "alcoolique," "lobotomisé," }
    
    set pip3 {"tu es" "tu pourrais être" "tu ressembles à" "tu pues comme" \
    "tu me fais penser à" "tu ne vaux pas mieux qu#" }
    
    set pip4 {"une sale merde" "un parasite" "un gros naze" "un petit bouffon" \
    "un minable" "un gland" }
    
    set pip5 {"qui pue," "de service," "totalement minable," "en polystyrène," \
    "qui pète au lit," "immonde," "boutonneux,"}
    
    set pip6 {"je voudrais" "j'aurais aimé" "j'essaierai de" "je sais pas ce qui me retient de" "je rêve de" "je crève d'envie de"  "j'ai fait le pari de" "je vomis à l'idée de"}
    
    set pip7 {"t'éclater la gueule" "te bruler la cervelle" "te broyer les couilles" "t'exploser la tête" "te gerber dessus" "te mettre ma main sur la gueule" "t'arracher les yeux" "te découper en morceaux" "te pisser à la raie" "te prendre la tête"}
    
    set pip8 {"juste un peu" "une bonne fois" "de temps en temps" \
    "jusqu'à l'aube" "vite fait" "sur une impulsion" "vivement" "pour rigoler" "quand tu veux" "devant témoins"}
    
    set pip9 {"ou tu veux" "entre les doigts de pied" "avec mes mains pleines de doigts" "au boulot" "sous la lune" "si tu as 5 minutes" "avant d'oublier" "sans complexes" "après le match de foot" "si les vent te poussent"}


    set versionName "Insultotron"
    set versionNum "1.0"
    
     proc accorde {phrase1 phrase2} {
        if {[string index $phrase1 end]!="#"} { return "$phrase1 "; }
        set mychar [string index $phrase2 0]
        if {[string match {[aeiouyhéè]} $mychar]} {
            set phrase1 [string replace $phrase1 end end "\'"]
        } else {
            set phrase1 [string replace $phrase1 end end "e "]
        }
        return $phrase1
    }
    
    bind pub - "!insultotron" ::insultotron::go
    proc go { nick uhost handle chan arg} {
        set ph1 [lindex $::insultotron::pip1 [rand [llength $::insultotron::pip1]]]
        set ph2 [lindex $::insultotron::pip2 [rand [llength $::insultotron::pip2]]]
        set ph3 [lindex $::insultotron::pip3 [rand [llength $::insultotron::pip3]]]
        set ph4 [lindex $::insultotron::pip4 [rand [llength $::insultotron::pip4]]]
        set ph5 [lindex $::insultotron::pip5 [rand [llength $::insultotron::pip5]]]
        set ph6 [lindex $::insultotron::pip6 [rand [llength $::insultotron::pip6]]]
        set ph7 [lindex $::insultotron::pip7 [rand [llength $::insultotron::pip7]]]
        set ph8 [lindex $::insultotron::pip8 [rand [llength $::insultotron::pip8]]]
        set ph9 [lindex $::insultotron::pip9 [rand [llength $::insultotron::pip9]]]
        set ph3 [::insultotron::accorde $ph3 $ph4]
        putserv "PRIVMSG $chan :$ph1 $ph2 $ph3$ph4 $ph5 $ph6 $ph7 $ph8 $ph9."
    }
}

putlog "$insultotron::versionName par $::insultotron::versionNum chargé"
