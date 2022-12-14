PipePair = Class{}

-- size of the gap between pipes 
-- local GAP_HEIGHT = 90 -- Now we are randomizing the gaps between 80 and 120

function PipePair:init(y)
    -- flag to hold whether this pair has been scored (jumped through)
    self.scored = false

    -- initialize pipes past the end of the screen
    self.x = VIRTUAL_WIDTH +  math.random(32, 52)

    -- y value is for the topmost pipe; gap is a vertical shift of the second lower pipe
    self.y = y

    -- instantiate two pipes that belong to this pair
    self.pipes = {
        ['upper'] = Pipe('top', self.y),
        ['lower'] = Pipe('bottom', self.y + PIPE_HEIGHT + math.random(79, 120))
    }

    -- whether this pipe pair is ready to be removed from the scene
    self.remove = false
end

function PipePair:update(dt)
    -- remove the pipe from the scene if it's beyond the left edge of the screen,
    -- else move it from right to left
    if self.x > -PIPE_WIDTH then
        self.x = self.x - PIPE_SPEED * dt
        self.pipes['lower'].x = self.x
        self.pipes['upper'].x = self.x
    else
        self.remove = true
    end
end

function PipePair:render()
    for l, pipe in pairs(self.pipes) do
        pipe:render()
    end
end