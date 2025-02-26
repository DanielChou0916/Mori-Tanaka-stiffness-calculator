function sortedCellArray = sortCellByEmbeddedNumber(cellArray)
    % Extract numbers from each cell
    numbers = zeros(size(cellArray));
    for i = 1:length(cellArray)
        num = regexp(cellArray{i}, '\d+', 'match');
        if ~isempty(num)
            numbers(i) = str2double(num{1});
        else
            numbers(i) = NaN; % Handle strings with no numbers
        end
    end

    % Sort based on these numbers, handling NaN values
    [~, sortedIndices] = sort(numbers, 'MissingPlacement', 'last');

    % Arrange the cell array based on sorted indices
    sortedCellArray = cellArray(sortedIndices);
end

