module ExtractNameFromHost
  def name
    if match = request.host.match(/(.+).cf-hero.+/)
      match[1].split(".").last.split("-").map(&:capitalize).join(" ")
    else
      request.host.capitalize
    end
  end
end
