#For example, given the following spreadsheet:

#5 1 9 5
#7 5 3
#2 4 6 8
#The first row's largest and smallest values are 9 and 1, and their difference is 8.
#The second row's largest and smallest values are 7 and 3, and their difference is 4.
#The third row's difference is 6.
#In this example, the spreadsheet's checksum would be 8 + 4 + 6 = 18.



def sumatory(str)
  rows = str.split("\n")
  elems = []
  rows.each do |elem|
    arr = []
    maxi = -1
    mini = 999999999
    row = elem.split(' ')
    row.each do |elem|
      elem_i = elem.to_i
      arr << elem_i
      maxi = elem_i if elem_i > maxi
      mini = elem_i if elem_i < mini
    end
    resta = maxi-mini
    elems << resta
  end
  #p elems

end

str='5  1 9 5
7 5 3
2 4 6 8'

str2='515	912	619	2043	96	93	2242	1385	2110	860	2255	621	1480	118	1230	99
161	6142	142	1742	237	6969	211	4314	5410	4413	3216	6330	261	3929	5552	109
1956	4470	3577	619	105	3996	128	1666	720	4052	108	132	2652	306	1892	1869
2163	99	2257	895	112	1771	1366	1631	2064	2146	103	865	123	1907	2362	876
1955	3260	1539	764	185	5493	5365	5483	4973	175	207	1538	4824	205	1784	2503
181	3328	2274	3798	1289	2772	4037	851	1722	3792	175	603	725	158	2937	174
405	247	2083	956	725	258	2044	206	2054	561	2223	2003	2500	355	306	2248
837	937	225	1115	446	451	160	1219	56	61	62	922	58	1228	1217	1302
1371	1062	2267	111	135	2113	1503	2130	1995	2191	129	2494	2220	739	138	1907
3892	148	2944	371	135	1525	3201	3506	3930	3207	115	3700	2791	597	3314	132
259	162	186	281	210	180	184	93	135	208	88	178	96	25	103	161
1080	247	1036	936	108	971	908	1035	123	974	103	1064	129	1189	1089	938
148	1874	122	702	922	2271	123	111	454	1872	2142	2378	126	813	1865	1506
842	267	230	1665	2274	236	262	1714	3281	4804	4404	3833	661	4248	3893	1105
1112	1260	809	72	1104	156	104	1253	793	462	608	84	99	1174	449	929
707	668	1778	1687	2073	1892	62	1139	908	78	1885	800	945	712	57	65'

results = sumatory(str)
#p results.sum()

#p str
#p str2

=begin
For example, given the following spreadsheet:

5 9 2 8
9 4 7 3
3 8 6 5
In the first row, the only two numbers that evenly divide are 8 and 2; the result of this division is 4.
In the second row, the two numbers are 9 and 3; the result is 3.
In the third row, the result is 2.
In this example, the sum of the results would be 4 + 3 + 2 = 9.

What is the sum of each row's result in your puzzle input?
=end

results_2 = sumatory(str2)
# p results_2.sum()

def sumatory2(str)
  rows = str.split("\n")
  elems = []
  rows.each do |elem|
    arr = []
    maxi = -1
    mini = 999999999
    row = elem.split(' ')
    row.each_with_index do |elem, idx|
      elem_i = elem.to_i
      arr << elem_i
      row[idx+1..-1].each do |elem_2|
        p "elem:#{elem}---elem_2:#{elem_2}, module:#{elem%elem_2} "
        if elem_i % elem_2.to_i == 0
          maxi = elem_i
          mini = elem_2.to_i
          break
        end
        if elem_2.to_i % elem_i == 0
          maxi = elem_2.to_i
          mini = elem_i
          break
        end
      end
      #maxi = elem_i if elem_i > maxi
      #mini = elem_i if elem_i < mini
    end
    resta = maxi/mini
    elems << resta
  end
  p elems

end

str_22 = '5 9 2 8
9 4 7 3
3 8 6 5'

sumatory2(str_22)

arr_final = sumatory2(str2)
p arr_final.sum()
