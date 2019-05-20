package service;

import java.io.Serializable;

public class ResponseRecommend implements Serializable {
    public Long data[];

    public void printData() {
        for(int i = 0; i < data.length; i++) {
            System.out.println(data[i]);
        }
    }
    
    @Override
    public String toString() {
    	StringBuilder stringBuilder = new StringBuilder();
    	stringBuilder.append("(");
    	int length = data.length;
    	for (int i = 0; i < length - 1; i++) {
    		stringBuilder.append(data[i]);
    		stringBuilder.append(",");
    	}
    	stringBuilder.append(data[length - 1]);
    	stringBuilder.append(")");
    	return stringBuilder.toString();
    }
}