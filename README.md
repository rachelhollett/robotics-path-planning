# robotics-path-planning
A* and RRT path search algorithms I coded as part of Northwestern's 'Modern Robotics' course on Coursera.

The main functions are 'Astar' and 'RRTplanner,' and all the helper functions I coded to make things easier to read are included as well.  
Each algorithm has a 'results' folder with an example of the input and output csv files, as well as a screenshot of the path, nodes, and edges modeled in CoppeliaSim.

#### A* shortest path algorithm
-takes a csv file of nodes and a csv of connecting edges  
-generates a csv with the order of nodes for the shortest path

#### RRT path planning algorithm
-takes a csv file of obstacle coordinates  
-generates a csv file of nodes, a csv of connecting edges, and a csv with the order of nodes for a path that does not cross any obstacles
