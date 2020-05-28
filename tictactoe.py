#Cade Lueker 
# Terminal Tic Tac Toe project
import random

# print the board showing the number associated with a position
def print_board(board):
    print("\n"*32)
    print("    1  |   2  |   3   ")
    print("    "+board[0]+"  |   "+board[1]+"  |   "+board[2]+"   ")
    print("-------|------|-------")
    print("    4  |   5  |   6   ")
    print("    "+board[3]+"  |   "+board[4]+"  |   "+board[5]+"   ")
    print("-------|------|-------")
    print("    7  |   8  |   9   ")
    print("    "+board[6]+"  |   "+board[7]+"  |   "+board[8]+"   ")

# give the player the option of 'x' or 'o' and set the players accordingly
def player_input():
    answer = ""
    # wait for a correct response to assign players
    while answer != "x" and answer != "o":
        answer = input("do you want to be 'x' or 'o'? --> ")
        if answer == "x":
            player1 = "x"
            player2 = "o"
        else:
            player1 = "0"
            player2 = "x"
    players = (player1,player2)
    return players

# occupies a specific spot on the board with the symbol associated with the player
def player_move(board, player, position):
    board[position-1] = player

# check for a victory     
def victory_test(board, player):
    x = 0
    # look through the columns for a victory
    while x < 3:
        if board[x] == player and board[x + 3] == player and board[x+6] == player:
            print("\nvictory for "+player)
            return True
        x += 1
    y = 0 
    # look through the rows for a victory
    while y < 7:
        if board[y] == player and board[y + 1] == player and board[y+2] == player:
            print("\nvictory for "+player)
            return True
        y += 3
    z = 0
    # look through the diagonals
    if board[z] == player and board[z + 4] == player and board[z + 8] == player:
        print("\nvictory for "+player)
        return True
    z = 6
    if board[z] == player and board[z - 2] == player and board[z - 4] == player:
        print("\nvictory for "+player)
        return True
    else:
        return False

# determine who gets the first move
def choose_first():
    p = random.randint(1,2)
    if p == 1:
        return "1"
    else:
        return "2"

# check that the given position is avaliable on the board
def space_check(board, position):
    if board[position-1] != " ":
        return False
    else:
        return True

# check that the board is full
def full_board_check(board):
    pos = 1
    filled = 0
    # check every position
    while pos <= 9:
        if space_check(board, pos) == False:
            filled += 1
        pos += 1
    if filled == 9:
        return True
    else:
        return False

# handle the user input for positions 
def player_choice(board):
    choice = ""
    # waits for user input
    while choice == "":
        choice = (input("position--> "))
        # make sure the space is avaliable
        if space_check(board, int(choice)):
            return int(choice)
        # give another chance for open position
        else:
            choice = ""

# ask if the player wants to resart the game    
def replay():
    answer = ""
    # wait for an answer
    while answer == "":
        answer = input("do you want to play again?--> ")
        if answer =="yes":
            return True
        elif answer == "no":
            return False
        else:
            answer = ""
            
# initial print statement 
print('lets play terminal Tic Tac Toe!')

# play is intially set to true starting the game
play = True

# the game will continue if play is true
while play:
    # set up the board
    players = player_input()
    board = [" "]*9
    print_board(board)
    first = choose_first()
    print("\n"+players[int(first)-1]+"'s move")
    x = 1
    victory = False
    full = False
    # keep the game going until the board is full or a player wins
    while full == False and victory == False:
        move = player_choice(board)
        player_move(board, (players[(int(first)+x)%2]),int(move))
        print_board(board)
        full = full_board_check(board)
        victory = victory_test(board, players[(int(first)+x)%2])
        x += 1
        # handle the end of the game
        if full or victory:
            again = replay()
            # player wants to play again
            if again:
                print("\n"*32)
                board = [" "]*9
            # end game
            elif again == False:
                play = False
        else:
            print("\n"+players[(int(first)+x)%2]+"'s move")
    
    
