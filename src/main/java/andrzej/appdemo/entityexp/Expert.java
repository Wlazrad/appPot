package andrzej.appdemo.entityexp;


import andrzej.appdemo.comment.Comment;
import andrzej.appdemo.user.User;
import lombok.ToString;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Collection;

@Entity
@Table(name = "expert", schema = "mojabaza")
public class Expert {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "expert_id")
    private int expert_id;

    @NotNull
    @Column(name = "name")
    private String name;

    @NotNull
    @Column(name = "location")
    private String location;

    @NotNull
    @Column(name = "job")
    private String job;

    @NotNull
    @Column(name = "details")
    private String details;

    @Column(name = "image_url")
    private String image_url;


    @Column(name = "number")
    private int number;

    @Column(name="user_id")
    private int user_id;


    @ToString.Exclude
    @OneToMany(mappedBy = "expert", cascade = CascadeType.ALL)
    @Fetch(FetchMode.JOIN)
    private Collection<Comment> comments;



    public Expert() {
    }

    public Expert(String name, String location, String job, String details, int number) {
        this.name = name;
        this.location = location;
        this.job = job;
        this.details = details;
        this.number = number;

    }


    public int getExpert_id() {
        return expert_id;
    }

    public void setExpert_id(int expert_id) {
        this.expert_id = expert_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Collection<Comment> getComments() {
        return comments;
    }

    public void setComments(Collection<Comment> comments) {
        this.comments = comments;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
}
