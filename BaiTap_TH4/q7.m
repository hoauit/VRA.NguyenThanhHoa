function q7(n)
    %Load du lieu train
    imgTrainAllLoad = load('data/imgTrainImagesAll.mat');
    lblTrainAllLoad = load('data/lblTrainLabelsAll.mat');
    imgTrainAll = imgTrainAllLoad.imgTrainImagesAll;
    lblTrainAll = lblTrainAllLoad.lblTrainLabelsAll;
    %Load du lieu test
    imgTestAllLoad = load('data/imgTestImagesAll.mat');
    lblTestAllLoad = load('data/lblTestLabelsAll.mat');
    imgTestAll = imgTestAllLoad.imgTestImagesAll;
    lblTestAll = lblTestAllLoad.lblTestLabelsAll;
    
    Mdl = fitcknn(imgTrainAll' , lblTrainAll);
    arrImagesNTest = [];
    for i = 1:size(imgTestAll, 2)
       if (lblTestAll(i) == n)
          arrImagesNTest = [arrImagesNTest, imgTestAll(:, i)];
       end
    end
    countFail = 0;
    for i = 1:size(arrImagesNTest,2)
        imgTest = arrImagesNTest(:, i);
        lblPredictTest = predict(Mdl, imgTest');
        if (lblPredictTest ~= n)
            countFail = countFail + 1;
        end
    end
    
    fprintf('So anh co label %d bi nhan dang sai la %d\n', n, countFail);
end