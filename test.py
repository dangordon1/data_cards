import os
import glob

dir_names = ["MLP-bg_zjets_vv-NeuronType=radial-NCycles=800-HiddenLayers=10,10-LearningRate=0.002-EstimatorType=CEgreater_than",
			"MLP-bg_zjets_vv-NeuronType=radial-NCycles=800-HiddenLayers=10,10-LearningRate=0.02-EstimatorType=CEgreater_than",
			"MLP-bg_zjets_vv-NeuronType=radial-NCycles=800-HiddenLayers=10,20-LearningRate=0.002-EstimatorType=CEgreater_than",
			"MLP-bg_zjets_vv-NeuronType=radial-NCycles=800-HiddenLayers=10,20-LearningRate=0.02-EstimatorType=CEgreater_than",
			"MLP-bg_zjets_vv-NeuronType=radial-NCycles=800-HiddenLayers=2,4,8-LearningRate=0.02-EstimatorType=CEgreater_than",
			"MLP-bg_zjets_vv-NeuronType=radial-NCycles=800-HiddenLayers=2,4-LearningRate=0.002-EstimatorType=CEgreater_than",
			"MLP-bg_zjets_vv-NeuronType=radial-NCycles=800-HiddenLayers=2,4-LearningRate=0.02-EstimatorType=CEgreater_than",
			"MLP-bg_zjets_vv-NeuronType=radial-NCycles=800-HiddenLayers=20,40-LearningRate=0.002-EstimatorType=CEgreater_than",
			"MLP-bg_zjets_vv-NeuronType=radial-NCycles=800-HiddenLayers=20,40-LearningRate=0.02-EstimatorType=CEgreater_than"]

for dir_name in dir_names:
	file_paths = []   
	has_nan = False
	counter = 1                                                                                                         
	for subdir, dirs, files in os.walk(dir_name):   
		for file in files:
			if file.lower().endswith('.txt'):
				path = os.path.join(subdir, file)
				f = open(path, "r")

				for line in f:
					if ("nan" in line) or ("inf" in line):
						print "...File " + path + " has " + str(counter) + " lines with nan or inf..."
						counter += 1
						has_nan = True
				f.close()
				if has_nan:
					print "=> Removing file " + path + "..."
					os.remove(path)

	print file_paths

