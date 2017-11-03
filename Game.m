clc, clear
load Adventure;
fprintf('Welcome to The Elder Scrolls 6 Beta.')
%Name = input('\nWhat do you want to name your character?\n', 's');
%Q1 =  input('\You want your name to be %s?',Name)
Diffn = 0;
while Diffn == 0
Diffs = input('\nDo you want to play on Easy, Medium, or Hard?\n','s');
Diffs = upper(Diffs);
if strcmp(Diffs, 'EASY')
    Diffn = 1;
elseif strcmp(Diffs, 'MEDIUM')
    Diffn = 2;
elseif strcmp(Diffs, 'HARD')
    Diffn = 3;
else 
    disp('\nJeez, can''t follow a simple direction?')
end
end
fprintf('Use WASD to move.')

%% player stats 

Ph = 100; %Health
Pa = 1; %Attack
Pd = 1; %Defence
Ps = 1; %Speed
Pl = 1; %Level

%% Spawners
for k = 1:Diffn*2
    for l = 1:2
    Monste(l,k)= randi(10);
    end
end
Swor = [randi(10);randi(10)];
Shiel = [randi(10);randi(10)];
Boot = [randi(10);randi(10)];
for n = 1:4-Diffn
    for m = 1:2
        Healt(n,m) = randi(10);
    end
end

%plots monsters
%
for k = 1:Diffn*2
    a = Monste(1,k);
    b = Monste(2,k);
    World{a,b} = Monster
end

for k = 1:(4-Diffn)
a = Healt(k,1);
b = Healt(k,2);
    World{a,b} = Health
end

World{Swor(1),Swor(2)} = Sword
World{Shiel(1),Shiel(2)} = Shield
World{Boot(1),Boot(2)} = Boots
World{10,10} = Door
World{1,1} = Player
imshow([World{1,:};World{2,:};World{3,:};World{4,:};World{5,:};World{6,:};
  World{7,:};World{8,:};World{9,:};World{10,:}]);

%% Movement

Play = [1,1]
while 1 < Play(1) < 10 && 1< Play(2) <10
%Player movement beginning
World{Play(1),Play(2)} = Blank
Pm = input('\nWhich direction do you want to move?','s');
if strcmp(Pm, 'w')
    Play(1) = Play(1) - 1;
elseif strcmp(Pm, 's')
    Play(1) = Play(1) + 1;
elseif strcmp(Pm, 'a') 
    Play(2) = Play(2) - 1;
elseif strcmp(Pm, 'd')
    Play(2) = Play(2) + 1;
else
fprintf('Error')
end
World{Play(1),Play(2)} = Player
%end player movement

%monster movement Begin
for k = 1:Diffn*2
    a = Monste(1,k);
    b = Monste(2,k);
    World{a,b} = Blank
end

for k = 1:Diffn*2
    for l = 1:2
        if Monste(l,k) == 1
        Monste(l,k) = Monste(l,k) + (randi(2)-1)
        elseif Monste(l,k) == 10
        Monste(l,k) = Monste(l,k) + (randi(2)-2)
        else
        Monste(l,k) = Monste(l,k) + (randi(3)-2)
        end
    end
end
    
for k = 1:Diffn*2
    a = Monste(1,k);
    b = Monste(2,k);
    World{a,b} = Monster
end
World{Swor(1),Swor(2)} = Sword
World{Shiel(1),Shiel(2)} = Shield
World{Boot(1),Boot(2)} = Boots
World{10,10} = Door
%Monster movement end

imshow([World{1,:};World{2,:};World{3,:};World{4,:};World{5,:};World{6,:};
  World{7,:};World{8,:};World{9,:};World{10,:}]);

end
fprintf('You win')









