using ConwaysGame
using Plots

board = [[1,1],[1,2],[2,2],[2,3],[3,1]]
xlim, ylim = [-4, 4], [-4, 4]
shift = 4

a = Animation()

for _ in 1:100
    frame(a, show_board(board, xlim, ylim))
    board = update(board)
    if any([cell[1] == xlim[1] for cell in board])
        xlim[1] -= shift
        xlim[2] -= shift
    end
    if any([cell[2] == ylim[1] for cell in board])
        ylim[1] -= shift
        ylim[2] -= shift
    end
    if any([cell[1] == xlim[2] for cell in board])
        xlim[1] += shift
        xlim[2] += shift
    end
    if any([cell[2] == ylim[2] for cell in board])
        ylim[1] += shift
        ylim[2] += shift
    end
end

gif(a, "figures/glider.gif", fps=10)