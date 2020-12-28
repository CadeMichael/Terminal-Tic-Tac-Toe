#include <iostream>
#include <vector>
#include <string>

// function declarations

std::vector<std::string> createBoard();

void printBoard(std::vector<std::string> board); 

void newLines(int n);

std::vector<std::string> startup();

std::vector<std::string> chooser(std::vector<std::string> board, std::string player);

bool victory(std::vector<std::string> board, std::string player);


int main()
{
    
    std::cout << "Welcome to Terminal Tic-Tac-Toe";
    newLines(3);
    std::vector<std::string> players = startup();
    std::vector<std::string> board = createBoard();
    newLines(100);
    printBoard(board);
    bool over = false;
    int turn = 0;
    newLines(10);
    
    while (over == false && turn < 9)
    {
        board = chooser(board,players[turn % 2]);
        newLines(100);
        printBoard(board);
        over = victory(board, players[turn % 2]);
        turn += 1;
        newLines(10);
    }
    
}

//function definitions

std::vector<std::string> createBoard() 
{
    std::vector<std::string> board = {" "," "," "," "," "," "," "," "," "};
    return board;
}

void printBoard(std::vector<std::string> board) 
{
    std::cout <<"    1  |   2  |   3   \n";
    std::cout <<"    "<<board[0]<<"  |   "<<board[1]<<"  |   "<<board[2]<<"   \n";
    std::cout <<"-------|------|-------\n";
    std::cout <<"    4  |   5  |   6   \n";
    std::cout <<"    "<<board[3]<<"  |   "<<board[4]<<"  |   "<<board[5]<<"   \n";
    std::cout <<"-------|------|-------\n";
    std::cout <<"    7  |   8  |   9   \n";
    std::cout <<"    "<<board[6]<<"  |   "<<board[7]<<"  |   "<<board[8]<<"   \n";
}

void newLines(int n)
{
    while (n > 0)
    {
        n = n-1;
        std::cout << "\n";
    }
}

std::vector<std::string> startup()
{
    std::string player1;
    std::string player2;
    std::vector<std::string> players = {"",""};
    
    
    while (player1 != "x" && player1 != "o")
    {
        std::cout << "player 1, do you want to be 'x' or 'o' -> ";
        std::cin >> player1;
    }
    
    if (player1 == "x")
    {
        player2 = "o";
    }
    else 
    {
        player2 = "x";
    }
    
    players[0] = player1;
    players[1] = player2;
    
    newLines(3);
    std::cout << player1 << " and " << player2;
    newLines(3);
    
    return players;
}
    
std::vector<std::string> chooser(std::vector<std::string> board, std::string player)
{
    int pos = 10;
    
    while ((pos > 9 || pos < 0) || board[pos-1] != " ")
    {
        std::cout << player << "'s choice -> ";
        std::cin >> pos;
    }
    
    board[pos-1] = player;
    return board;
}

bool victory(std::vector<std::string> board, std::string player)
{
    int x = 0;
    while (x < 3)
    {
        if (board[x] == player && board[x + 3] == player && board[x+6] == player)
        {
            std::cout <<"\nvictory for "<<player;
            return true;
        }
        x += 1;
    }
    
    int y = 0; 
    while (y < 7)
    {
        if (board[y] == player && board[y + 1] == player && board[y+2] == player)
        {
            std::cout<<"\nvictory for "<<player;
            return true;
        }
        y += 3;
    }
    
    int z = 0;
    if (board[z] == player && board[z + 4] == player && board[z + 8] == player)
    {
        std::cout<<"\nvictory for "<<player;
        return true;
    }
    
    z = 6;
    if (board[z] == player && board[z - 2] == player && board[z - 4] == player)
    {
        std::cout<<"\nvictory for "<<player;
        return true;
    }
    else{
        return false;
    }
}
