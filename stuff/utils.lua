function rgb(r, g, b)
    return {r/255, g/255, b/255}
end

function rgba(r, g, b, a)
    return {r/255, g/255, b/255, a}
end

function Alpha(rgb, a)
    return {rgb[1], rgb[2], rgb[3], a}
end

function ResetColor()
    love.graphics.setColor(1, 1, 1, 1)
end

function AABB(a, b)
  return a.x < b.x+b.w and
         b.x < a.x+a.w and
         a.y < b.y+b.h and
         b.y < a.y+a.h
end

function NewImage(name)
    return love.graphics.newImage("assets/imgs/"..name..".png")
end