Bacteria[] swarm;
int swarmSize = 100;
int r,g,b;
void setup()   
{     
	size (750,500);
	background(128);
	swarmInitialize();
	frameRate(30);
	draw();
}
void swarmInitialize ()
{
	swarm = new Bacteria[swarmSize];
	for (int i = 0; i < swarmSize; i++)
		swarm[i] = new Bacteria();
}
void draw()   
{
	//background(128); 
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
	int r,g,b;
	Bacteria()
	{
		X = (int)(Math.random()*750);
		Y = (int)(Math.random()*500);
		r = (int)(Math.random()*256);
		g = (int)(Math.random()*256);
		b = (int)(Math.random()*256);
	}
	void move()
	{
		X-=(X-mouseX)/15;
		Y-=(Y-mouseY)/15;
		/*
		if (distance(X,Y,mouseX,mouseY) < 30)
		{
			X-=(X-mouseX);
			Y-=(Y-mouseY);
		}
		else
		{
			int xChange = 0;
			int yChange = 0;
			boolean notDone = true;
			while (1!=0)
			{
				xChange = (int)(Math.random()*21)-10;
				if (X+xChange > 0 && X+xChange < 750)
					break;
			}
			while (1!=0)
			{
				yChange = (int)(Math.random()*21)-10;
				if (Y+yChange > 0 && Y+yChange < 500)
					break;
			}
			X+=xChange;
			Y+=yChange;
		}
		*/
		fill(r,g,b);
		ellipse(X,Y,20,20);
	}
}

void keyPressed ()
{
	if (key == 32)
		swarmInitialize();
}