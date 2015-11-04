json.array!(@pacientes) do |paciente|
  json.extract! paciente, :id, :nome, :data_nascimento, :sexo, :image
  json.url paciente_url(paciente, format: :json)
end
