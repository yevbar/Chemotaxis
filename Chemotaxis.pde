//TODO @ 49
Bacteria[] swarm;
int swarmSize = 100;
int r,g,b;
//declare bacteria variables here   
void setup()   
{     
	size (750,750);
	background(128);
	swarm = new Bacteria[swarmSize];
	for (int i = 0; i < swarmSize; i++)
		swarm[i] = new Bacteria();
	r = (int)(Math.random()*256);
	g = (int)(Math.random()*256);
	b = (int)(Math.random()*256);
	frameRate(30);
	draw();
}   
void draw()   
{
	background(128); 
	for (int i = 0; i < swarmSize; i++)
		swarm[i].move();
}
int distance (int x1,int y1,int x2,int y2)
{
	int xDist = abs(x1-x2);
	int yDist = abs(y1-y2);
	return (int)sqrt(xDist*xDist+yDist*yDist);
}
class Bacteria    
{     
	int X,Y;
	Bacteria()
	{
		X = (int)(Math.random()*750);
		Y = (int)(Math.random()*750);
	}
	void move()
	{
		if (distance(X,Y,mouseX,mouseY) < 30)
		{
			X-=(X-mouseX);
			Y-=(Y-mouseY);
		}
		else
		{
			int xChange = 0;
			int yChange = 0;
			//TODO - edit so that bacteria don't fly off screen
			boolean notDone = true;
			while (1!=0)
			{
				xChange = (int)(Math.random()*20)-10;
				if (X+xChange > 0 && X+xChange < 750)
					break;
			}
			while (1!=0)
			{
				yChange = (int)(Math.random()*20)-10;
				if (Y+yChange > 0 && Y+yChange < 750)
					break;
			}
			X+=xChange;
			Y+=yChange;
		}
		fill(r,g,b);
		ellipse(X,Y,20,20);
	}
}
/*

bacteria randomly move in any direction
if bacteria is within k units of the mouse, it moves directly away from the mouse (well, cursor, but you get what I'm saying)
whenever mouse is pressed, bacteria change color
*/