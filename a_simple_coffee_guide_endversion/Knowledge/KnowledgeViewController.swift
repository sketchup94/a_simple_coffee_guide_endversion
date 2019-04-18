//
//  KnowledgeViewController.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 17.03.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit

class KnowledgeViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    // let/var
    
    var storage : [String : Any] = ["Name": "Storage", "Image": UIImage(named: "Storage")!, "Tips": ["You should use pre-ground coffee within 2 weeks because it loses quickly its aroma", "Store your coffee in a dark, dry and cool place", "Use a package with an aroma valve, which allows gases from the coffee to escape without air entering", "Don´t store your coffee in the fridge, because it can easily absorb moisture and foreign aromas"]]
    
    var water : [String : Any] = ["Name": "Coffee water", "Image": UIImage(named: "Water")!, "Tips": ["Water with a pH value of 7.0 and a total hardness of approx. 4 - 8°d is ideal for preparing coffee", "https://www.wasserhaerte.net/ here you check the water hardness ( at least for Germany, Switzerland, Austria, and Belgium )", "If your water is to hard, you can use a table water filter to soften it"]]
    
    var health : [String : Any] = ["Name": "Health", "Image": UIImage(named: "Health")!, "Tips": ["In the short-term caffeine has a diuretic effect, but regular coffee drinkers get used to the caffeine intake. If you take coffee regularly, your fluid balance will be effected solely by the amount of water supplied with the coffee", "Caffeine takes between 30 - 45 minutes to enter the bloodstream and has a half-life of about 4 hours", "Caffeine stimulates, in small doses, the heart and circulatory system, increases physical performance and increases concentration. Additionally, it can improve your mood. Recent studies showing that lifelong coffee consumption can reduce the risk of depression and age-related decline in mental performance", "Yes, I could be biased :D", "The downside of too much caffeine: can lead to potassium deficiency, muscle problems, fatigue and headaches"]]
    
    var history : [String : Any] = ["Name": "History of Coffee", "Image": UIImage(named: "History")!, "Tips": ["The word \"coffee\" comes from the word koffie (Dutch), which was taken from the Ottomans Turkish word kahve, which was taken from the Arabic gahwah", "According to the legends, the shepherd Kaldi notices that his goats are jumping upside down the whole night after eating the red coffee cherries. Intrigued by it, Kaldi finds the fruit himself and start chewing them. Amazed and afraid by the effects, he brings the berries to a monk in a nearby monastery. The monk, who never see something like this before, is afraid that this could be the work of the devil and therefore threw them into the fire, from which a seductive aroma rises, causing the monk and Kaldi to investigate further", "Coffee was first mentioned in the Kaffa region of southwest Ethiopia in 900 A.D. The ethnic group (nowadays called Oromo) gave their tribesman coffee to be better hunters", "Ethiopia → Yemen → Mecca, Medina → Cairo, Damascus, Baghdad and Constantinople (15 hundred)", "But in the Islamic world drinking coffee wasn´t mainly for pleasure, it was directly connected to religious practices. It should help to fast in the day and stay awake at night during Ramadan", "Drinking coffee spread to Italy, before it got passed to the rest of Europe. After, the Dutch Republic started exporting coffee beans to the East Indies and to the Americas"]]
    
    var fabrication : [String : Any] = ["Name": "Fabrication", "Image": UIImage(named: "Fabrication")!, "Tips": ["There just two types of coffee which became important for the world market: \"Arabica\" and \"Robusta\". Arabica plants account for around 70% of the global coffee cultures", "Coffee bushes need ideally rainfall of around 1500 - 2000 liters per square meter and plenty of sunlight", "Coffee seeds are generally planted in large beds in shaded nurseries. They need ideally rainfall of around 1500 - 2000 liters per square meter and plenty of sunlight", "The fruit, called the coffee cherry, turns a bright, deep red when it is ripe and ready to be harvested. Usually, there is one major harvest a year. Picking the crop is often done by hand and is a labor-intensive and difficult process", "Quickly after picking processing must begin to prevent fruit spoilage. Coffee is processed in one of two ways:", "1. The Dry Methode: The freshly picked cherries are spread simply out on huge surfaces to dry in the sun. This process can take several weeks and ends when the moisture content of the cherries drops to 11 - 12 %", "2. The Wet Method: After harvesting, the pulp is being removed from the coffee cherry so the bean is dried with only the parchment skin left on. Then the beans are getting separated by weight and then passed through a series of rotating drums which separate them by size. After separation, the beans are transported to large, water-filled fermentation tanks. While laying in the tanks, naturally occurring enzymes will cause the slick layer of mucilage that is still attached to the parchment to dissolve. After fermentation, they are ready for drying", "Before the coffee can be exported in shipping containers, it has to be hulled, polished and sorted", "Samples of the coffee are tested for quality and taste daily. Not just to determine their characteristics, but also for creating the proper roast. This process is called cupping and usually takes place in a specially designed room", "Roasting takes place in the importing country because the freshly roasted beans must reach the consumer asap. Most roasting machines maintain a temperature of about 287° degrees. After reaching around 200° degrees the beans are starting to turn brown and the caffeol, a fragant oil from inside the bean, begins to appear. This process produces the aroma of the coffee we drink. The beans are getting cooled after the roasting process immediately by water or air", "After this, just grinding and preparing your coffee is missing from you and your cup of delicious coffee"]]
    
    var regions : [String : Any] = ["Name": "Regions", "Image": UIImage(named: "Regions")!, "Tips": ["Brazil - the South American country with tropical climate is with the production of more than 30% of the world´s traded coffee export-champion", "B - The coffee beans are harvested predominantly by hand and drying out in the blazing sun", "B - The main costumer are USA and Europe, especially Germany", "B - Since Brazil is using more and more pesticides in production, there is are some concerns about negative health effects in the long term", "B - The flavour is predominantly mild with little acidity", "Colombia - The coffee from the third largest coffee exporter is known for its high quality and purity", "C - The Tinto, how a typical Colombian bitter coffee is called, is usually drunk black, without milk or sugar", "C - For the most part the coffee is grown in Caldas, Risaralda, and Quinidio - also known as the \"coffee triangle of Colombia\"", "C - Coffee is the main source of income for around 500.000 Colombians", "Ethiopia - the birthplace of coffee", "E - The work by hand guarantees highest quality, because only ripe fruits are harvested", "E - To produce larger quantities can be processed while maintaining the high quality, small farmers often organize themselves in cooperations", "E - Ethiopia is one of the poorest countries in the world. 85 percent of jobs are closely linked to coffee production, and around 60 percent of government revenue comes from the export of coffee beans", "Vietnam - Vietnam became the second biggest coffee exporter in the world", "V - 90% of the planted coffee is Robusta, which is particularly resistant to pests and thrives even under the worst conditions, even if the coffee farmer does not know exactly what he is doing. This could be the reason why it is not considered to produce high-quality coffee", "V - In Vietnam, they drink a ca phe nau (brown coffee) or ca phe sua (milk coffee), which is cold coffee with condensed milk. The condensed milk dates back to earlier times when it was difficult to cool food"]]
    
    var knowledgedict = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        knowledgedict.append(storage)
        knowledgedict.append(water)
        knowledgedict.append(health)
        knowledgedict.append(history)
        knowledgedict.append(fabrication)
        knowledgedict.append(regions)
        
        tableview.dataSource = self
        tableview.delegate = self
    
        }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
 
    
}

extension KnowledgeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return knowledgedict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KnowledgeTableViewCell", for: indexPath) as! KnowledgeTableViewCell
        
        if let brew = knowledgedict[indexPath.row]["Name"] as? String {
            cell.cellLabel!.text = brew
        }
        
        if let image = knowledgedict[indexPath.row]["Image"] as? UIImage {
            cell.imageview.image = image
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
}

extension KnowledgeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "OtherDetailViewController") as? OtherDetailViewController {
            vc.passedDict = knowledgedict[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

