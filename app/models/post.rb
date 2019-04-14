class Post < ApplicationRecord

  belongs_to :user
  belongs_to :category

  def self.search(keywords)
    if keywords.blank?
      self.all.order('created_at DESC')
    else
      self.where('title LIKE ?', "%#{keywords}%") #ce qui est contenu dans la variable keywords peut etre se trouver n'importe ou dans le titre
    end
  end

end
