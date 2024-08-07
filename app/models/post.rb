class Post < ApplicationRecord
=begin
    Ce modèle représente la table 'posts' dans la base de données.
  
    Le fichier modèle est généré automatiquement avec la commande :
    | rails generate model Post name:string content:text |
    qui crée à la fois une migration pour la table 'posts' et ce fichier modèle 'post.rb'.
  
    En revanche, la commande :
    | rails generate migration Post name:string content:text |
    crée uniquement une migration sans créer le fichier modèle.
=end
end
  


=begin C'est avec Post.new Post.find(1).name = .... |
interagir avec la base de données en fournissant une interface pour lire, écrire, et modifier 
les données.


ApplicationRecord est une classe de base fournie par Rails pour tous les modèles. 
Elle fournit des méthodes pour interagir avec la base de données, telles que all, find, where, etc.

=end