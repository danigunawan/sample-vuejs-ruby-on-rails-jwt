json.array! @videos do|video|
    json.(video, :id, :title, :url_path)
    json.user_name video.user.name
    json.url_base @url_base
end