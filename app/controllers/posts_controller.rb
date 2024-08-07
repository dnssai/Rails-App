class PostsController < ApplicationController

  before_action :set_post, only:[:update,:edit,:show,:destroy]
  after_action :delete_info, only:[:update]


  def index
    cookies.delete(:username) 
    session[:user_id] = {username: 'JO', id:5}
    @posts = Post.all
    respond_to do |format|
      format.html
      format.json {render json: @posts.as_json(only: [:id])} #Triage, on peut également changer la méthode as_json(post.rb)
      format.xml { render xml: @posts}

    end
  end

  def show

    unless @post
      redirect_to posts_path
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to posts_path, success: 'Article  Modifié ! ! ' #crée un la clé success dans le hash flash avec sa valeur
  end

  def new
    @post = Post.new 
    #crée une nouvelle instance de Post, mais ne l'enregistre pas encore dans la base de données.
    # demande de complétion du formaulaire
  end

  def create # Après avoir confirmer l'envoi du formulaire
    @post = Post.create(post_params) #paramètre du formulaire (name, content) | .create a l'option save
    if @post.save #Vérifie si l'enregistrement à bien été save dans la db
      redirect_to posts_path, success: 'Article  Crée ! ! '
    else
      render :new # réaffiche le formulaire de création avec les erreurs de validation.
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: "Article '#{@post.name}' supprimé !"
  end

  private

  def post_params
    params.require(:post).permit(:name, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def delete_info
    p session.inspect
    p "--------------"
    p flash.inspect
  end
end


=begin
 L'action index est généralement responsable de récupérer les données de la base de données (post.rb)
 et de les transmettre à la vue index.html.erb.

 En définissant @post, vous permettez à Rails de transmettre automatiquement cette variable à la vue, 
 où vous pouvez l'utiliser pour afficher les détails de l'article. == Variable global
=end