module ConwaysGame
    """A late-night project as I wait to leave the observatory"""

    using Plots

    function get_neighbors(x::Int64, y::Int64)
        return [[x - 1, y - 1], [x - 1, y], [x - 1, y + 1], [x, y - 1], [x, y + 1], [x + 1, y - 1], [x + 1, y], [x + 1, y + 1]]
    end

    function will_live(board, cell, alive)
        neighbors = get_neighbors(cell...)
        num_live_neighbors = length(intersect(board, neighbors))
        if num_live_neighbors == 3
            return true
        elseif alive && num_live_neighbors == 2
            return true
        else
            return false
        end
    end

    function update(board::Vector{Vector{Int64}})
        # check if current cells are dying or living
        new_board = Vector{Vector{Int64}}()
        for cell in board
            # see if the currently-living cell will live
            if will_live(board, cell, true) && !(cell in new_board)
                push!(new_board, cell)
            end
            
            # check if there's any candidate dead cells to revive
            for n in get_neighbors(cell...)
                if !(n in new_board) && !(n in board) && will_live(board, n, false)
                    push!(new_board, n)
                end
            end
        end
        return new_board
    end

    function show_board(board::Vector{Vector{Int64}}, xlim, ylim)
        xv, yv = [cell[1] for cell in board], [cell[2] for cell in board]
        grid = zeros(xlim[2] - xlim[1], ylim[2] - ylim[1])
        for cell in board
            grid[cell[1] - xlim[1] + 1, cell[2] - ylim[1] + 1] = 1
        end
        heatmap(grid, aspect_ratio=:equal, showaxis=false, grid=false, colorbar=:none, color=[:white,:blue])
    end

    export update, get_neighbors, will_live, show_board
end # module ConwaysGame
