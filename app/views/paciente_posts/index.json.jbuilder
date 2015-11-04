json.array!(@paciente_posts) do |paciente_post|
  json.extract! paciente_post, :id, :id_paciente, :id_post, :visualizacoes
  json.url paciente_post_url(paciente_post, format: :json)
end
