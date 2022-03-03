
FRange = {}
FRange.__index = FRange

function FRange:new( min, max )
    local stuff = {
        ["min"] = min,
        ["max"] = max
    }

    setmetatable( stuff, FRange )
    return stuff
end

function FRange:GetMin()
    return self.min
end

function FRange:GetMax()
    return self.max
end

function FRange:__tostring()
    return self.min .. " " .. self.max
end

function FRange:Percent( value )
    return math.TimeFraction(self.min, self.max, value)
end

function FRange:Lerp( value )
    return Lerp(value, self.min, self.max)
end

setmetatable( FRange, { __call = FRange.new } )