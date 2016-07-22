def partition(array, l, r)
  pivot_value = array[l]
  i = l + 1
  for j in (l+1)..r
    if array[j] < pivot_value
      array[i], array[j] = array[j], array[i]
      i += 1
    end
  end
  array[l], array[i-1] = array[i-1], array[l]
  r - l
end

def choose_pivot(array, l, r)
  # for last item
  # index = r

  # for randomized quick sort
  # index = l + rand(r - l + 1)

  # for median of three
  length = r - l + 1
  middle_index = length.odd? ? length/2 + l : length/2 + l - 1
  sorted = [array[l], array[r], array[middle_index]].sort
  index = array.index(sorted[1])

  array[l], array[index] = array[index], array[l]
  array[l]
end

def quicksort(array, l, r, comparisons)
  length = r - l + 1
  if length > 1
    pivot_value = choose_pivot(array, l, r)
    comparisons << partition(array, l, r)
    pivot_index = array.index(pivot_value)
    quicksort(array, l, pivot_index - 1, comparisons)
    quicksort(array, pivot_index + 1, r, comparisons)
    comparisons.inject(0, :+)
  else
    array
  end
end

# testing - first item
quicksort([3,9,8,4,6,10,2,5,7,1], 0, 9, []) # 25
quicksort([448,109,797,189,115,284,599,103,171,815,141,949,323,390,605,362,824,144,576,540,665,985,904,231,23,750,790,691,234,405,698,993,302,567,180,638,239,146,971,755,644,94,41,204,50,47,434,89,355,968,826,912,493,437,768,463,383,455,398,506,610,726,470,561,104,52,861,546,170,841,454,574,407,589,875,508,106,562,343,38,310,883,363,505,601,175,882,285,449,275,15,21,708,490,650,668,379,564,886,700,728,858,741,980,484,318,837,64,252,359,147,716,823,866,994,723,983,577,438,276,87,536,138,61,461,488,693,56,934,410,984,216,303,102,33,348,909,90,743,829,280,989,517,527,187,314,440,110,958,991,150,120,74,218,819,238,810,299,839,653,29,720,160,933,616,183,925,652,132,604,235,30,694,42,5,539,556,920,197,476,279,240,916,947,253,992,722,308,673,544,403,24,127,161,191,703,637,911,88,658,802,600,996,248,260,607,479,301,887,892,256,729,28,999,112,701,773,416,1000,899,157,876,136,134,813,347,697,629,809,95,384,935,714,54,860,178,412,618,332,761,27,411,131,649,126,963,485,595,739,209,433,319,469,513,55,12,431,798,452,864,851,880,952,975,491,636,512,374,779,794,964,682,990,274,950,368,581,58,871,533,553,560,73,821,14,733,63,651,67,542,647,81,190,247,978,929,44,939,667,776,628,872,327,349,579,43,11,158,76,777,266,130,48,603,242,770,495,450,185,229,923,174,772,631,380,523,995,465,936,2,817,291,856,822,1,674,114,621,71,381,93,172,663,283,613,930,421,807,220,656,96,8,373,462,309,100,193,82,322,57,251,771,632,846,614,760,593,101,606,153,688,188,424,619,859,959,325,670,32,969,786,268,906,474,690,145,210,742,223,956,219,879,192,532,847,459,399,548,897,799,471,419,869,10,98,921,307,881,812,196,345,917,72,988,919,986,62,849,378,801,953,51,646,237,584,718,444,940,997,543,734,865,244,748,765,643,221,498,756,84,40,752,397,689,602,351,759,671,538,870,78,565,135,845,232,382,745,394,788,586,976,955,124,313,278,245,597,456,900,913,148,707,862,681,654,946,195,414,169,687,236,482,563,466,117,961,711,289,836,902,142,696,737,79,376,888,129,467,155,205,45,855,199,430,662,683,20,377,630,312,6,436,457,792,814,13,566,111,123,243,211,198,893,475,404,432,367,194,36,645,942,137,86,537,396,35,712,735,844,486,335,731,908,661,7,972,884,357,727,709,395,502,535,121,781,77,370,233,447,156,330,659,927,352,541,848,321,152,521,863,612,704,774,753,162,341,531,504,587,787,965,702,425,80,496,626,803,344,286,159,573,623,998,529,264,105,360,179,273,831,417,311,296,620,375,128,122,258,657,806,633,970,113,265,288,468,26,293,487,834,324,445,559,391,68,92,60,37,315,791,979,139,497,833,108,617,83,594,954,217,896,549,22,905,59,184,591,582,800,230,889,320,767,401,208,808,173,885,228,255,328,271,118,608,924,65,558,393,957,635,356,168,675,840,555,894,719,874,305,163,182,317,669,337,639,250,945,679,915,339,877,429,494,749,938,678,692,592,477,590,203,757,4,907,520,435,516,385,201,423,570,944,987,511,655,386,782,441,34,167,740,202,500,820,427,69,525,336,762,551,981,422,17,825,751,186,922,585,754,177,580,609,648,282,575,624,838,966,805,974,715,300,641,346,775,811,732,261,9,578,316,746,530,3,660,547,557,903,747,119,640,329,392,534,292,364,910,222,816,287,789,615,763,890,634,290,721,878,680,868,677,249,515,926,672,713,873,420,738,154,736,686,369,928,31,828,295,241,257,499,215,263,509,572,744,406,143,402,439,340,480,891,342,39,588,778,483,334,277,206,960,528,622,852,522,764,611,710,895,796,259,53,176,151,552,510,408,706,931,898,460,246,827,977,784,666,338,25,49,676,695,75,583,914,66,269,514,554,766,200,453,297,270,795,426,642,932,388,298,372,446,699,16,415,724,937,867,181,97,354,353,331,948,366,625,70,281,125,489,705,443,107,598,853,212,225,569,413,730,91,458,503,518,294,267,371,685,717,165,684,568,272,507,481,149,982,262,830,166,46,473,962,306,18,19,842,213,361,918,116,973,365,418,758,901,850,350,226,596,818,133,627,254,545,951,832,941,843,725,409,550,428,526,501,780,227,214,326,442,835,387,854,164,333,793,464,785,967,304,571,207,519,524,358,400,783,85,664,472,492,389,451,943,769,478,857,224,99,140,804], 0, 999, []) # 10297

# solving the problem - first item
array = []
File.open('QuickSort.txt').each do |line|
  array << line.to_i
end
quicksort(array, 0, array.count - 1, []) # 162085

# testing - last item
quicksort([3,9,8,4,6,10,2,5,7,1], 0, 9, []) # 29
quicksort([448,109,797,189,115,284,599,103,171,815,141,949,323,390,605,362,824,144,576,540,665,985,904,231,23,750,790,691,234,405,698,993,302,567,180,638,239,146,971,755,644,94,41,204,50,47,434,89,355,968,826,912,493,437,768,463,383,455,398,506,610,726,470,561,104,52,861,546,170,841,454,574,407,589,875,508,106,562,343,38,310,883,363,505,601,175,882,285,449,275,15,21,708,490,650,668,379,564,886,700,728,858,741,980,484,318,837,64,252,359,147,716,823,866,994,723,983,577,438,276,87,536,138,61,461,488,693,56,934,410,984,216,303,102,33,348,909,90,743,829,280,989,517,527,187,314,440,110,958,991,150,120,74,218,819,238,810,299,839,653,29,720,160,933,616,183,925,652,132,604,235,30,694,42,5,539,556,920,197,476,279,240,916,947,253,992,722,308,673,544,403,24,127,161,191,703,637,911,88,658,802,600,996,248,260,607,479,301,887,892,256,729,28,999,112,701,773,416,1000,899,157,876,136,134,813,347,697,629,809,95,384,935,714,54,860,178,412,618,332,761,27,411,131,649,126,963,485,595,739,209,433,319,469,513,55,12,431,798,452,864,851,880,952,975,491,636,512,374,779,794,964,682,990,274,950,368,581,58,871,533,553,560,73,821,14,733,63,651,67,542,647,81,190,247,978,929,44,939,667,776,628,872,327,349,579,43,11,158,76,777,266,130,48,603,242,770,495,450,185,229,923,174,772,631,380,523,995,465,936,2,817,291,856,822,1,674,114,621,71,381,93,172,663,283,613,930,421,807,220,656,96,8,373,462,309,100,193,82,322,57,251,771,632,846,614,760,593,101,606,153,688,188,424,619,859,959,325,670,32,969,786,268,906,474,690,145,210,742,223,956,219,879,192,532,847,459,399,548,897,799,471,419,869,10,98,921,307,881,812,196,345,917,72,988,919,986,62,849,378,801,953,51,646,237,584,718,444,940,997,543,734,865,244,748,765,643,221,498,756,84,40,752,397,689,602,351,759,671,538,870,78,565,135,845,232,382,745,394,788,586,976,955,124,313,278,245,597,456,900,913,148,707,862,681,654,946,195,414,169,687,236,482,563,466,117,961,711,289,836,902,142,696,737,79,376,888,129,467,155,205,45,855,199,430,662,683,20,377,630,312,6,436,457,792,814,13,566,111,123,243,211,198,893,475,404,432,367,194,36,645,942,137,86,537,396,35,712,735,844,486,335,731,908,661,7,972,884,357,727,709,395,502,535,121,781,77,370,233,447,156,330,659,927,352,541,848,321,152,521,863,612,704,774,753,162,341,531,504,587,787,965,702,425,80,496,626,803,344,286,159,573,623,998,529,264,105,360,179,273,831,417,311,296,620,375,128,122,258,657,806,633,970,113,265,288,468,26,293,487,834,324,445,559,391,68,92,60,37,315,791,979,139,497,833,108,617,83,594,954,217,896,549,22,905,59,184,591,582,800,230,889,320,767,401,208,808,173,885,228,255,328,271,118,608,924,65,558,393,957,635,356,168,675,840,555,894,719,874,305,163,182,317,669,337,639,250,945,679,915,339,877,429,494,749,938,678,692,592,477,590,203,757,4,907,520,435,516,385,201,423,570,944,987,511,655,386,782,441,34,167,740,202,500,820,427,69,525,336,762,551,981,422,17,825,751,186,922,585,754,177,580,609,648,282,575,624,838,966,805,974,715,300,641,346,775,811,732,261,9,578,316,746,530,3,660,547,557,903,747,119,640,329,392,534,292,364,910,222,816,287,789,615,763,890,634,290,721,878,680,868,677,249,515,926,672,713,873,420,738,154,736,686,369,928,31,828,295,241,257,499,215,263,509,572,744,406,143,402,439,340,480,891,342,39,588,778,483,334,277,206,960,528,622,852,522,764,611,710,895,796,259,53,176,151,552,510,408,706,931,898,460,246,827,977,784,666,338,25,49,676,695,75,583,914,66,269,514,554,766,200,453,297,270,795,426,642,932,388,298,372,446,699,16,415,724,937,867,181,97,354,353,331,948,366,625,70,281,125,489,705,443,107,598,853,212,225,569,413,730,91,458,503,518,294,267,371,685,717,165,684,568,272,507,481,149,982,262,830,166,46,473,962,306,18,19,842,213,361,918,116,973,365,418,758,901,850,350,226,596,818,133,627,254,545,951,832,941,843,725,409,550,428,526,501,780,227,214,326,442,835,387,854,164,333,793,464,785,967,304,571,207,519,524,358,400,783,85,664,472,492,389,451,943,769,478,857,224,99,140,804], 0, 999, []) # 10184

# solving the problem - last item
quicksort(array, 0, array.count - 1, []) # 164123

# testing - median of 3
quicksort([3,9,8,4,6,10,2,5,7,1], 0, 9, []) # 21
quicksort([57,97,17,31,54,98,87,27,89,81,18,70,3,34,63,100,46,30,99,10,33,65,96,38,48,80,95,6,16,19,56,61,1,47,12,73,49,41,37,40,59,67,93,26,75,44,58,66,8,55,94,74,83,7,15,86,42,50,5,22,90,13,69,53,43,24,92,51,23,39,78,85,4,25,52,36,60,68,9,64,79,14,45,2,77,84,11,71,35,72,28,76,82,88,32,21,20,91,62,29], 0, 99, []) # 518
quicksort([448,109,797,189,115,284,599,103,171,815,141,949,323,390,605,362,824,144,576,540,665,985,904,231,23,750,790,691,234,405,698,993,302,567,180,638,239,146,971,755,644,94,41,204,50,47,434,89,355,968,826,912,493,437,768,463,383,455,398,506,610,726,470,561,104,52,861,546,170,841,454,574,407,589,875,508,106,562,343,38,310,883,363,505,601,175,882,285,449,275,15,21,708,490,650,668,379,564,886,700,728,858,741,980,484,318,837,64,252,359,147,716,823,866,994,723,983,577,438,276,87,536,138,61,461,488,693,56,934,410,984,216,303,102,33,348,909,90,743,829,280,989,517,527,187,314,440,110,958,991,150,120,74,218,819,238,810,299,839,653,29,720,160,933,616,183,925,652,132,604,235,30,694,42,5,539,556,920,197,476,279,240,916,947,253,992,722,308,673,544,403,24,127,161,191,703,637,911,88,658,802,600,996,248,260,607,479,301,887,892,256,729,28,999,112,701,773,416,1000,899,157,876,136,134,813,347,697,629,809,95,384,935,714,54,860,178,412,618,332,761,27,411,131,649,126,963,485,595,739,209,433,319,469,513,55,12,431,798,452,864,851,880,952,975,491,636,512,374,779,794,964,682,990,274,950,368,581,58,871,533,553,560,73,821,14,733,63,651,67,542,647,81,190,247,978,929,44,939,667,776,628,872,327,349,579,43,11,158,76,777,266,130,48,603,242,770,495,450,185,229,923,174,772,631,380,523,995,465,936,2,817,291,856,822,1,674,114,621,71,381,93,172,663,283,613,930,421,807,220,656,96,8,373,462,309,100,193,82,322,57,251,771,632,846,614,760,593,101,606,153,688,188,424,619,859,959,325,670,32,969,786,268,906,474,690,145,210,742,223,956,219,879,192,532,847,459,399,548,897,799,471,419,869,10,98,921,307,881,812,196,345,917,72,988,919,986,62,849,378,801,953,51,646,237,584,718,444,940,997,543,734,865,244,748,765,643,221,498,756,84,40,752,397,689,602,351,759,671,538,870,78,565,135,845,232,382,745,394,788,586,976,955,124,313,278,245,597,456,900,913,148,707,862,681,654,946,195,414,169,687,236,482,563,466,117,961,711,289,836,902,142,696,737,79,376,888,129,467,155,205,45,855,199,430,662,683,20,377,630,312,6,436,457,792,814,13,566,111,123,243,211,198,893,475,404,432,367,194,36,645,942,137,86,537,396,35,712,735,844,486,335,731,908,661,7,972,884,357,727,709,395,502,535,121,781,77,370,233,447,156,330,659,927,352,541,848,321,152,521,863,612,704,774,753,162,341,531,504,587,787,965,702,425,80,496,626,803,344,286,159,573,623,998,529,264,105,360,179,273,831,417,311,296,620,375,128,122,258,657,806,633,970,113,265,288,468,26,293,487,834,324,445,559,391,68,92,60,37,315,791,979,139,497,833,108,617,83,594,954,217,896,549,22,905,59,184,591,582,800,230,889,320,767,401,208,808,173,885,228,255,328,271,118,608,924,65,558,393,957,635,356,168,675,840,555,894,719,874,305,163,182,317,669,337,639,250,945,679,915,339,877,429,494,749,938,678,692,592,477,590,203,757,4,907,520,435,516,385,201,423,570,944,987,511,655,386,782,441,34,167,740,202,500,820,427,69,525,336,762,551,981,422,17,825,751,186,922,585,754,177,580,609,648,282,575,624,838,966,805,974,715,300,641,346,775,811,732,261,9,578,316,746,530,3,660,547,557,903,747,119,640,329,392,534,292,364,910,222,816,287,789,615,763,890,634,290,721,878,680,868,677,249,515,926,672,713,873,420,738,154,736,686,369,928,31,828,295,241,257,499,215,263,509,572,744,406,143,402,439,340,480,891,342,39,588,778,483,334,277,206,960,528,622,852,522,764,611,710,895,796,259,53,176,151,552,510,408,706,931,898,460,246,827,977,784,666,338,25,49,676,695,75,583,914,66,269,514,554,766,200,453,297,270,795,426,642,932,388,298,372,446,699,16,415,724,937,867,181,97,354,353,331,948,366,625,70,281,125,489,705,443,107,598,853,212,225,569,413,730,91,458,503,518,294,267,371,685,717,165,684,568,272,507,481,149,982,262,830,166,46,473,962,306,18,19,842,213,361,918,116,973,365,418,758,901,850,350,226,596,818,133,627,254,545,951,832,941,843,725,409,550,428,526,501,780,227,214,326,442,835,387,854,164,333,793,464,785,967,304,571,207,519,524,358,400,783,85,664,472,492,389,451,943,769,478,857,224,99,140,804], 0, 999, []) # 8921

# solving the problem - median of 3
quicksort(array, 0, array.count - 1, []) # 138382
