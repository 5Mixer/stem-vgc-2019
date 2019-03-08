var solution = new Solution('VGC Game');
var project = new Project('VGC Game');


project.setDebugDir('build/linux');
project.addSubProject(Solution.createProject('build/linux-build'));
project.addSubProject(Solution.createProject('/home/mixer/.haxe/libs/kha/16,1,2'));
project.addSubProject(Solution.createProject('/home/mixer/.haxe/libs/kha/16,1,2/Kore'));

solution.addProject(project);
return solution;
