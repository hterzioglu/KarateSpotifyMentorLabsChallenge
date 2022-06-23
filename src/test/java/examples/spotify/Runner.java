package examples.spotify;

import com.intuit.karate.junit5.Karate;

public class Runner {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("senaryo").relativeTo(getClass());
    }
}
