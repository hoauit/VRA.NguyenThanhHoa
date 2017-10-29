function q5(n)
    imgTrainAllLoad = load('data/imgTrainImagesAll.mat');
    lblTrainAllLoad = load('data/lblTrainLabelsAll.mat');
    imgTrainAll = imgTrainAllLoad.imgTrainImagesAll;
    lblTrainAll = lblTrainAllLoad.lblTrainLabelsAll;
    
    Mdl = fitcknn(imgTrainAll' , lblTrainAll);
    
    imgTestAllLoad = load('data/imgTestImagesAll.mat');
    imgTestAll = imgTestAllLoad.imgTestImagesAll;
    imgTest = imgTestAll(:, n);
    lblPredictTest = predict(Mdl, imgTest');
    fprintf('Ket qua nhan dang anh thu %d trong tap test la %d\n', n, lblPredictTest);
end