var project = new Project('VGC Game');
project.addLibrary('ecs')
project.addLibrary('differ')
project.addAssets('Assets/**');
project.addSources('Sources');
return project;
