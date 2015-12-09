class Foodanswer < ActiveRecord::Base

  belongs_to :user

  validates :cajero_recibio_sonrisa_amable,                 inclusion: { in: [ true, false ], message: "Please choose one."  }
  validates :servido_empleado_distinto,                     inclusion: { in: [ true, false ], message: "Please choose one."  }
  validates :conocimiento_menu,                             inclusion: { in: [ true, false ], message: "Please choose one."  }
  validates :ofrecio_especial,                              inclusion: { in: [ true, false ], message: "Please choose one."  }
  validates :area_externa_limpia,                           presence: true
  validates :interior_limpio,                               presence: true
  validates :impresion_menu,                                presence: true
  validates :orden_servida_exactamente,                     presence: true
  validates :plato_principal_sabor,                         presence: true
  validates :observacion_general,                           presence: true
  validates :orden_servida_exactamente_como_se_ordeno,      presence: true


end
