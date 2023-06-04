using ConwaysGame
using Plots

board = [
    [0, 2],
    [1, 1],
    [1, 3],
    [2, 0],
    [3, 0],
    [4, 0],
    [5, 0],
    [6, 0],
    [7, 0], 
    [8, 1],
    [9, 2],
    [8, 3],
    [7, 4],
    [6, 4],
    [5, 4],
    [4, 4],
    [3, 4],
    [2, 4]
]

xlim = [-5, 15]
ylim = [-5, 10]

a = Animation()
for _ = 1:30
    frame(a, show_board(board, xlim, ylim))
    board = update(board)
end
gif(a, "figures/pentadecathlon.gif", fps=5)