## Reactive Microservice Frameworks for JVM - 2021

### What are Reactive Microservices?

Reactive microservices are microservices written using a reactive programming model.

Wikipedia defines reactive programming as a "programming paradigm concerned with data streams and the propagation of change". 

#### Reactive Streams
Quoting the original Reactive Streams spec (http://www.reactive-streams.org/), "Reactive Streams is an initiative to provide a standard for asynchronous stream processing with non-blocking back pressure. This encompasses efforts aimed at runtime environments (JVM and JavaScript) as well as network protocols.".

With Java 9, you get Reactive Streams implementation right out of the JDK, no frameworks needed. See https://docs.oracle.com/javase/9/docs/api/java/util/concurrent/Flow.html

The way to think about reactive programs is programs written in an asynchronous
manner with backpressure.

#### Backpressure
Backpressure is a concept in asynchronous programs that helps implement flow control.

Consider the following scenario:
- I have asynchronous functions, X, Y, and Z, where X invokes Y, Y invokes Z.
- Suppose threads processing Y are slowed down for a few seconds due to a temporary network issue.
- When the network recovers, Y floods Z with a high number of calls.

Backpressure comes into picture at this moment. 

It ensures there is proper flow control baked into the processing such that Z (indirectly) communicates with Y that it is being flooded. Consequently, Y reduces the volume of calls it is sending to Z.

As you can see the program flows from left to right, but the components on the right have a way to let the components on the left know to slow down when needed.

One of the key features of reactive frameworks discussed here is to offer developers the capability of backpressure in a flow without
the developer explicitly coding for it.

## Why Reactive?

Now, while I can write correct behavior with a traditional, non-asynchronous program, it does lead to wastage of compute resources. Threads would be sitting idle waiting for a network response when they could be doing other tasks.

Building asynchronous programs thus ties back to the business goal of efficient utilization of available resources.

## Should I refactor my code to a reactive paradigm?

While I definitely recommend using an asynchronous, reactive approach for building new services, I do not recommend re-factoring an existing codebase that is *successfully* handling
production traffic. 

If your team's answer is always to throw more hardware (higher RAM, more cores, more pods, etc.) at any problem regarding load, maybe it is 
time to revisit your code or solution.

My metric for success is dollars spent to maintain a service to achieve a desired throughput. Lower the spend, greater the success.

With the explosion of developer resources available to build systems, you can find numerous ways to build a solution to achieve high throughput, some more costlier than others. The successful ones inevitably are built in a manner that ensure you spend less dollars to support them over a long period of time.

Having said that, if you are adding new features to an existing codebase, you should still look to leverage the capabilities offered by reactive style of coding.

See Reactive Programming here on Wikipedia: https://en.wikipedia.org/wiki/Reactive_programming

Learn about Reactive Streams on Wikipedia: https://en.wikipedia.org/wiki/Reactive_Streams

## Frameworks
Alright then, here is a short list of frameworks available for developers looking to build reactive microservices in 2021.

- Spring Reactive

    Resources:
     - https://spring.io/reactive
     - Building a Reactive RESTful Web Service with Spring: https://spring.io/guides/gs/reactive-rest-service/
    
    Who should use this?
    
    Teams already comfortable with the Spring ecosystem and not looking for change.

- Quarkus
    
    Resources:
    - https://quarkus.io/guides/getting-started-reactive
    
    Who should use this? 
    
    If you are already in a relationship with Red Hat, Quarkus offers great capabilities to build services, with startup times faster than Spring Boot.

    Note that you do not *need* Red Hat to build with Quarkus.

- Micronaut

    Resources:
     - https://micronaut.io
     - Micronaut Reactor: https://micronaut-projects.github.io/micronaut-reactor/latest/guide/index.html
     - Micronaut RxJava3 Integration: https://micronaut-projects.github.io/micronaut-rxjava3/latest/guide/index.html

    Who should use this?
    
    Developers who would prefer an alternative to Spring and Quarkus.
    
    One key distinction of Micronaut is that
unlike most frameworks, dependency injection (DI) and aspect oriented programming (AOP) do 
not use reflection (including, but especially Spring which is notorious for using reflection for DI and AOP).
This gives it comparative advantage in terms of speed. 

- Lagom 

    Resources:
     - https://www.lagomframework.com
    
    Who should use this?
    
    Teams using Scala that are familiar with Akka and Play frameworks.

- Akka

    Resources:
     - https://doc.akka.io/docs/akka-http/current/introduction.html
https://www.lightbend.com/microservices/reactive-microservices-events-domain-driven-design-ddd

  Who should use this?
    
  Teams familiar with Scala and Akka, but do not want the overhead of Play or Lagom frameworks. 

#### Recommendation
Well, no drama here, I steer clear of which one is the best, since saying only one technology is the best technology for every problem is 
just wrong. Well, to be honest, it is *not even wrong*. E.g., AWS is a great choice for cloud
services today, but it makes little business sense for a Walmart to use it.

I have offered at least one pointer for when each framework makes sense, and my advice is to see what your team's strengths are and then go from there. Ultimately, whatever choice you make, there are going to be challenges along the way, and having a team committed to a technology makes solving hard problems fun (no, it won’t make them easy :)).

### Additional Resources

#### Reading
 - https://en.wikipedia.org/wiki/Reactive_Streams
 - https://www.reactivemanifesto.org/
 - http://reactivex.io/intro.html

#### Libraries that help you do a performance evaluation
 - wrk (https://github.com/wg/wrk)
 - vegeta (https://github.com/tsenart/vegeta)