function q6(n)
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
    
    imgTest = imgTestAll(:, n);
    lblPredictTest = predict(Mdl, imgTest');
    lblImageTest = lblTestAll(n);
    
    figure;
    img2D = reshape(imgTest, 112,92);
    imshow(img2D);
    strLabelImage = ['Truoc khi du doan: ' , num2str(lblImageTest)];
    strLabelImage = [strLabelImage, ' Du doan: '];
    strLabelImage = [strLabelImage, num2str(lblPredictTest), '.'];
    
    if(lblPredictTest == lblImageTest)
        strLabelImage = [strLabelImage, ' ==> Dung.'];
    else
        strLabelImage = [strLabelImage, ' ==> Sai.'];
    end
    title(strLabelImage);
end