module ComputersHelper
  def conditional_link(model,method,message)
    if model.send(method) == ""
      link_to message, controller: "#{model.model_name.to_s.downcase}s", action: "show", id: model
    else
      link_to model.name, controller: "#{model.model_name.to_s.downcase}s", action: "show", id: model
    end
  end
end
