class ListsController < ApplicationController
  #  toutes les listes
  def index
    @lists = List.all
  end

  # détails d'une liste spécifique
  def show
    @lists = List.find(params[:id])
  end

  # pour créer une nouvelle liste
  def new
    @lists = List.new
  end
  # Crée une nouvelle liste après soumission du formulaire
  def create
    @lists = List.new(list_params)
    if @lists.save
      redirect_to list_path(@lists), notice: "Liste créée avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
end



private

# Méthode pour filtrer les paramètres autorisés
def list_params
  params.require(:lists).permit(:name, :image)  # Ajoute :image si tu as un champ pour l'image
end
end
