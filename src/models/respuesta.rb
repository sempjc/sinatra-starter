class Answer < ActiveRecord::Base

  belongs_to :user

  validates   :id,                                          presence: true
  validates   :user_id,                                     presence: true
  validates   :nombre_encuestador,                          presence: true
  validates   :nombre_restaurante,                          presence: true
  validates   :nombre_gerente,                              presence: true
  validates   :nombre_empleado_que_lo_atendio,              presence: true
  validates   :nombre_cajero,                               presence: true
  validates   :dia_visita,                                  presence: true
  validates   :cantidad_persona_fila,                       presence: true
  validates   :descripcion_orden,                           presence: true
  validates   :costo_total,                                 presence: true
  validates   :hora_llegada,                                presence: true
  validates   :hora_atendido,                               presence: true
  validates   :tiempo_total,                                presence: true
  validates   :sugirio_anadir_postre,                       presence: true
  validates   :gerente_presente,                            presence: true
  validates   :observacion_comida,                          presence: true
  validates   :empleado_presente_area_caja,                 presence: true
  validates   :sugirio_agrandar_orden,                      presence: true
  validates   :orden_servida_exactamente_como_se_ordeno,    presence: true
  validates   :ofrecio_especial_o_plato_principal,          presence: true
  validates   :acompanante_tempreratura,                    presence: true
  validates   :bebida_sabor_temperatura,                    presence: true
  validates   :interior_restaurante_apariencia,             presence: true
  validates   :area_safacon_limpio,                         presence: true
  validates   :postre_temperatura,                          presence: true
  validates   :interior_limpio,                             presence: true
  validates   :empleados_buena_apariencia,                  presence: true
  validates   :mantuvo_contacto_visual_mientras_toma_orden, presence: true
  validates   :area_externa_limpia,                         presence: true
  validates   :plato_principal_sabor,                       presence: true
  validates   :acompanante_sabor,                           presence: true
  validates   :empleados_concentrados_trabajando,           presence: true
  validates   :acompanante_apariencia,                      presence: true
  validates   :postre_sabor,                                presence: true
  validates   :orden_servida_distinto_empleado,             presence: true
  validates   :area_de_caja_limpia_ordenada,                presence: true
  validates   :plato_principal_temperatura,                 presence: true
  validates   :area_externas_apariencia,                    presence: true
  validates   :area_externas_limpia,                        presence: true
  validates   :observacion_servicio,                        presence: true
  validates   :observacion_personal,                        presence: true
  validates   :observacion_apariencia_establecimiento,      presence: true
end
