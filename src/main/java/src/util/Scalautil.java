package util;
import ReadHBase.PP;
import ReadHBase.job;
import ReadHBase.sala_FX;

public class Scalautil {


    public void daoScala(String job_name,String city,String sala){

//        PP.main(job_name,city,Integer.parseInt(sala));
        job.main(job_name);//ability
//        sala_FX.main("zhiwei",Integer.parseInt(sala));//sala1
    }
}