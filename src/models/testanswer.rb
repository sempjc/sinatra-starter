class Testanswer < ActiveRecord::Base

  belongs_to :user

  validates :acompanante_sabor,                             inclusion: { in: [ true, false ], message: "Please choose one."  }
  validates :orden_servida_exactamente_como_se_ordeno,      presence:  true

end
